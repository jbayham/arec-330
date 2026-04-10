

library(tidyverse)

cut_mult=.75

set.seed(331)

allocation_dat <- tibble(
  farm = paste0("Farm ", 1:18),
  crop = rep(c("corn", "soybeans", "alfalfa"), each = 6)
) %>%
  mutate(
    zone = rep(c("North", "Central", "South"), each = 6),
    seasonal_water_acft = round(145 + if_else(crop == "alfalfa", 15, 0) + rnorm(n(), 0, 20), 1),
    yield_bu_acre = round(155 - 0.3 * seasonal_water_acft + if_else(crop == "corn", 10, if_else(crop == "soybeans", 6, 0)) + rnorm(n(), 0, 8), 1),
    drought_stress_index = round(45 + 0.2 * seasonal_water_acft + if_else(zone == "South", 6, 0) + rnorm(n(), 0, 5), 1)
  )

write_csv(allocation_dat, "lab12_dat.csv")



glimpse(allocation_dat)

ggplot(allocation_dat, aes(x = seasonal_water_acft, y = yield_bu_acre, color = crop)) +
  geom_point(size = 3) +
  labs(x = "Seasonal Water (ac-ft)", y = "Yield (bu/acre)", color = "Crop") +
  theme_minimal()

ggplot(allocation_dat, aes(x = seasonal_water_acft, y = drought_stress_index, color = zone)) +
  geom_point(size = 3) +
  labs(x = "Seasonal Water (ac-ft)", y = "Drought Stress Index", color = "Zone") +
  theme_minimal()

value_dat <- allocation_dat %>%
  mutate(value = case_when(
    crop == "corn" ~ yield_bu_acre*5,
    crop == "soybeans" ~ yield_bu_acre*6,
    crop == "alfalfa" ~ yield_bu_acre*7
  ))

#Determine cut
old_water <- sum(value_dat$seasonal_water_acft)
new_water <- old_water*cut_mult

#Use value per ac-ft to determine optimal allocation (like a BC ratio)
opt_value <- value_dat %>%
  mutate(val_acft = value/seasonal_water_acft) %>%
  arrange(desc(val_acft)) %>%
  mutate(cum_water = cumsum(seasonal_water_acft)) 

best_value = summarise(opt_value,best_val = sum(value[cum_water <= new_water])) %>% pull()

#Equal cut
equal_value <- value_dat %>%
  mutate(new_val = value*cut_mult) %>%
  summarise(equal_val = sum(new_val)) %>% pull()

equal_value

tibble(
  method = c("Optimal", "Equal"),
  value = c(best_value, equal_value)
) %>%
  ggplot(aes(x = method, y = value, fill = method)) +
  geom_col() +
  labs(x = "Allocation Method", y = "Total Value") +
  theme_minimal() +
  theme(legend.position = "none")
