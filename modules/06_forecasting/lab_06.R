#Lab 6 forecasting

library(fpp3)              # loads tsibble, feasts, fable, etc.
library(tidyverse)

setwd("~/Documents/lab_06")

################################
#Read drought data

dsci_raw <- read_csv("drought_weekly.csv")

glimpse(dsci_raw)

#Filter to one state and convert to tsibble format for time series analysis
dsci_state <- dsci_raw %>%
  filter(state_alpha == "CO") %>%
  group_by(state_alpha,month = yearmonth(measure_date)) %>%
  summarize(mean_dsci = mean(dsci, na.rm = TRUE),
            .groups = "drop") %>%
  as_tsibble(index = month)


dsci_state %>%
  autoplot(mean_dsci) +
  labs(
    title = paste("Monthly DSCI: CO"),
    y = "DSCI",
    x = NULL
  )

fit_stl <- dsci_state |>
  model(
    STL(mean_dsci ~ trend(window = 13), robust = TRUE)
  )

components(fit_stl) |>
  autoplot() +
  labs(title = paste("STL decomposition:", "CO"))


cmp <- components(fit_stl)

cmp |>
  as_tibble() |>
  select(month, mean_dsci, season_adjust) |>
  pivot_longer(cols = c(mean_dsci, season_adjust), names_to = "series", values_to = "value") |>
  ggplot(aes(x = month, y = value)) +
  geom_line() +
  facet_wrap(~series, ncol = 1, scales = "free_y") +
  labs(
    title = paste("Original vs seasonally adjusted:", "CO"),
    x = NULL, y = NULL
  )


# Choose test window length
h <- 24

# Find the last date
last_month <- max(dsci_state$month)

train <- dsci_state |>
  filter(month <= (last_month - h))

test <- dsci_state |>
  filter(month > (last_month - h))


fit_dcmp <- train |>
  model(
    stlf = decomposition_model(
      STL(mean_dsci ~ trend(window = 13), robust = TRUE),
      NAIVE(season_adjust)
    )
  )

fc_dcmp <- fit_dcmp |>
  forecast(h = h)

fc_dcmp |>
  autoplot(dsci_state) +
  labs(
    title = paste("Decomposition-based forecast (STL + NAIVE):", "CO"),
    y = "DSCI",
    x = NULL
  )

accuracy(fc_dcmp, test)

fit_bench <- train |>
  model(
    snaive = SNAIVE(mean_dsci ~ lag("year") + drift())
  )

fc_bench <- fit_bench |>
  forecast(h = h)

accuracy(fc_bench, test)

fc_bench |>
  autoplot(dsci_state)

##############################
# ChatGPT options

#############################################
# Lab/Analysis: Crop condition (Good+Excellent) time series properties
# Uses the fpp3 (tidyverts) workflow
#
# Data: USDA NASS Crop Progress / Condition extract (long format)
# File provided by instructor:
#   /mnt/data/2992D242-42E0-3BCE-9557-05367C15A607.csv
#############################################

# install.packages("fpp3")  # if needed
library(fpp3)       # tsibble, feasts, fable, ggplot helpers
library(tidyverse)  # data wrangling
library(lubridate)  # date parsing helpers

# Optional (for imputing missing weeks so STL can run cleanly)
# install.packages("forecast")
library(forecast)   # na.interp()

#------------------------------------------------------------
# 1) Load and clean: build state-week Good/Excellent series
#------------------------------------------------------------

raw <- readr::read_csv("cord_condition.csv",
                       show_col_types = FALSE)

# Keep only STATE-level corn condition values for GOOD and EXCELLENT
cond_long <- raw %>%
  filter(`Geo Level` == "STATE",
         Commodity == "CORN",
         str_detect(`Data Item`, "CONDITION, MEASURED IN PCT (GOOD|EXCELLENT)")) %>%
  mutate(
    week_ending = as.Date(`Week Ending`),
    item = case_when(
      str_detect(`Data Item`, "PCT GOOD") ~ "good",
      str_detect(`Data Item`, "PCT EXCELLENT") ~ "excellent",
      TRUE ~ NA_character_
    ),
    value = as.numeric(Value),
    state = str_to_title(State)  # e.g., "TEXAS" -> "Texas"
  ) %>%
  select(state, week_ending, item, value) %>%
  filter(!is.na(item))

# Pivot to wide and compute Good+Excellent
cond_wide <- cond_long %>%
  pivot_wider(names_from = item, values_from = value) %>%
  mutate(
    good = replace_na(good, 0),
    excellent = replace_na(excellent, 0),
    ge = good + excellent
  )

# Create a weekly tsibble (panel time series)
# Index = yearweek(week_ending), Key = state
cond_ts <- cond_wide %>%
  mutate(week = yearweek(week_ending)) %>%
  as_tsibble(key = state, index = week) %>%
  arrange(state, week)

cond_ts
#------------------------------------------------------------
# 2) Make the weekly series "regular" (fill missing weeks)
#    Why: STL and many feature functions assume a regular index.
#
#    There are gaps because USDA reports condition only during the season.
#    We'll fill missing weeks and (optionally) interpolate to enable STL.
#------------------------------------------------------------

cond_reg <- cond_ts %>%
  group_by_key() %>%
  fill_gaps() %>%              # inserts missing weeks as rows with ge = NA
  ungroup()

# Interpolate missing weeks (needed for STL to run without NA issues).
# Intuition: we are smoothing across off-season gaps to study overall seasonal structure.
# For teaching, you might instead restrict to in-season weeks only.
cond_reg <- cond_reg %>%
  group_by(state) %>%
  mutate(
    ge_interp = forecast::na.interp(ge)  # linear-ish interpolation + seasonal handling
  ) %>%
  ungroup()

#------------------------------------------------------------
# 3) Choose a state to analyze (student-specific)
#------------------------------------------------------------

my_state <- "Iowa"   # change to assigned state (note: Title Case names, e.g., "Colorado")

one <- cond_reg %>% filter(state == my_state)

# Quick plot of raw vs interpolated series
one %>%
  select(week, ge, ge_interp) %>%
  pivot_longer(cols = c(ge, ge_interp), names_to = "series", values_to = "value") %>%
  autoplot(value) +
  facet_wrap(~series, ncol = 1, scales = "free_y") +
  labs(title = paste(my_state, "- Corn condition Good+Excellent (weekly)"),
       y = "Percent", x = NULL)

#------------------------------------------------------------
# 4) Time series "properties": seasonality, persistence, shocks
#    (A) Seasonal plots
#------------------------------------------------------------

# Seasonal plot by week-of-year
# Math idea: if y_t has a stable seasonal component S_t with period 52,
# then the average over years by week should show structure.
one %>%
  gg_season(ge_interp, period = "year") +
  labs(title = paste(my_state, "- Seasonal plot (week-of-year)"),
       y = "Good+Excellent (%)")

# Seasonal subseries plot (week-of-year means + variability)
one %>%
  gg_subseries(ge_interp, period = "year") +
  labs(title = paste(my_state, "- Seasonal subseries (week-of-year)"),
       y = "Good+Excellent (%)")

# (B) Autocorrelation / partial autocorrelation
# Intuition: ACF tells you how strongly current condition relates to past weeks.
one %>%
  ACF(ge_interp, lag_max = 104) %>% autoplot() +
  labs(title = paste(my_state, "- ACF (up to 2 years)"))

one %>%
  PACF(ge_interp, lag_max = 104) %>% autoplot() +
  labs(title = paste(my_state, "- PACF (up to 2 years)"))

#------------------------------------------------------------
# 5) Decomposition (STL): is decomposition-forecasting appropriate?
#
# Additive decomposition:
#   y_t = T_t + S_t + R_t
# where:
#   T_t = trend-cycle (slow movement across years)
#   S_t = seasonal pattern (repeats annually)
#   R_t = remainder (weather shocks, surprises)
#------------------------------------------------------------

fit_stl <- one %>%
  model(
    STL(ge_interp ~ trend(window = 13) + season(window = "periodic"),
        robust = TRUE)
  )

components(fit_stl) %>%
  autoplot() +
  labs(title = paste(my_state, "- STL decomposition (additive)"),
       x = NULL)

# You can also compute STL-based features (requires regular series, hence interpolation)
one %>%
  features(ge_interp, feat_stl) %>%
  print()

# Interpretation tips:
# - seasonal_strength_year: closer to 1 => strong stable seasonality (good for decomposition)
# - trend_strength: closer to 1 => strong slow-moving trend component

#------------------------------------------------------------
# 6) Decomposition-based forecasting demo (STL + method on seasonally adjusted)
#
# Forecasting with decomposition (additive):
#   y_t = SA_t + S_t, where SA_t = y_t - S_t
# Steps:
#   (1) Estimate S_t with STL
#   (2) Forecast seasonally adjusted series SA_t
#   (3) Add the seasonal component back: yhat_{t+h} = SAhat_{t+h} + Shat_{t+h}
#------------------------------------------------------------

# Train/test split: last 52 weeks held out
h <- 52
last_wk <- max(one$week)

train <- one %>% filter(week <= (last_wk - h))
test  <- one %>% filter(week >  (last_wk - h))

# A simple decomposition-model:
# - STL decomposition
# - Forecast the seasonally adjusted component with ARIMA (or NAIVE / RW)
# In fpp3, decomposition_model() automates the reseasonalization step.
fit_dcmp <- train %>%
  model(
    stl_arima = decomposition_model(
      STL(ge_interp ~ trend(window = 13) + season(window = "periodic"), robust = TRUE),
      ARIMA(season_adjust)
    ),
    stl_naive = decomposition_model(
      STL(ge_interp ~ trend(window = 13) + season(window = "periodic"), robust = TRUE),
      NAIVE(season_adjust)
    )
  )

fc <- fit_dcmp %>% forecast(h = h)

# Plot forecasts against the full series
fc %>%
  autoplot(one, level = 95) +
  labs(title = paste(my_state, "- Decomposition forecasts"),
       y = "Good+Excellent (%)", x = NULL)

# Accuracy on holdout
accuracy(fc, test)

# Benchmark: seasonal naive (hard to beat when seasonality dominates)
fit_bench <- train %>%
  model(snaive = SNAIVE(ge_interp ~ lag("year")))

fc_bench <- fit_bench %>% forecast(h = h)

accuracy(fc_bench, test)

# Compare models in one table
bind_rows(
  accuracy(fc, test) %>% mutate(model = .model),
  accuracy(fc_bench, test) %>% mutate(model = .model)
) %>%
  select(model, RMSE, MAE, MAPE) %>%
  arrange(RMSE)

#------------------------------------------------------------
# 7) Optional: repeat key diagnostics across all states
#    (helps you decide if decomposition-based forecasting is broadly appropriate)
#------------------------------------------------------------

# STL feature summary across states
state_feats <- cond_reg %>%
  group_by(state) %>%
  # ensure regular + interpolated series exists everywhere
  summarise(data = list(
    cur_data_all() %>%
      arrange(week) %>%
      mutate(ge_interp = forecast::na.interp(ge))
  ), .groups = "drop") %>%
  unnest(data) %>%
  as_tsibble(key = state, index = week) %>%
  features(ge_interp, feat_stl)

state_feats %>%
  arrange(desc(seasonal_strength_year)) %>%
  select(state, seasonal_strength_year, trend_strength, remainder_strength) %>%
  print(n = 20)

# If seasonal_strength_year is high for most states,
# decomposition-based forecasting is generally appropriate.


