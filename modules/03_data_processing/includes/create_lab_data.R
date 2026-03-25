# ============================================
# create_lab_data.R
# ============================================
# Script to engineer problems into clean drought/yield data for lab exercises
# This script creates four modified datasets for Week 3 lab activities:
# 1. Corn yield data with engineered missing values (Section 1)
# 2. Drought data reshaped to untidy form (Section 2)
# 3. Clean tidy weekly drought data (Sections 3-4)
# 4. Clean corn yield reference data (Sections 3-4)
#
# RUN THIS SCRIPT ONCE to generate all lab data files
# Output files will be saved to the includes/ directory

setwd("~/Documents/git_projects/arec-330/modules/03_data_processing/includes")
library(pacman)
p_load(tidyverse,naniar)

# ============================================
# SETUP: Load clean source data
# ============================================
# Assumes you have clean corn and drought data from Week 2 lab
# Modify paths as needed for your data location

corn_clean <- read_csv("corn_yield_2000-2025.csv")  # FROM WEEK 2
drought_weekly_clean <- read_csv("dm_state_2000-2025.csv")  # FROM WEEK 2

# Quick inspection
glimpse(corn_clean)
glimpse(drought_weekly_clean)

# ============================================
# SECTION 1: Create missing data scenarios
# ============================================
# Three types of engineered missingness:
# A. MCAR (Missing Completely at Random)
# B. MAR (Missing at Random - systematic pattern)
# C. Structural (entire years missing)

set.seed(330)  # reproducibility

corn_missing <- corn_clean %>%
  # Add MCAR: random 5% missing
  mutate(
    Value_mar = if_else(
      runif(n()) < 0.05,  # 5% threshold
      NA_real_,
      Value
    )
  )

# Add MNAR: low-yield observations less likely to be reported
# This mimics real-world reporting bias (e.g., poor years less likely to report)
corn_missing <- corn_missing %>%
  group_by(state_alpha) %>%
  mutate(
    state_median = median(Value, na.rm = TRUE),
    state_q15 = quantile(Value, 0.15, na.rm = TRUE),
    # Systematically remove some low-yield values with 70% probability
    Value_mnar = if_else(
      Value < state_q15 & runif(n()) < 0.7 & !is.na(Value),
      NA_real_,
      Value
    )
  ) %>%
  select(-state_median, -state_q15) %>%
  ungroup()


corn_missing %>%
  group_by(state_alpha) %>%
  #summarize(pct_missing = 100 * mean(is.na(Value))) %>%
  summarize(across(starts_with("Value"),~ 100*mean(is.na(.)))) %>%
  #arrange(desc(pct_missing)) %>%
  print(n = 32)


corn_missing %>%
  #group_by(state_alpha) %>%
  #summarize(pct_missing = 100 * mean(is.na(Value))) %>%
  summarize(across(starts_with("Value"),~mean(.,na.rm=T))) %>%
  #arrange(desc(pct_missing)) %>%
  print(n = 42)

# Save to includes/
write_csv(corn_missing, "corn_yield_missing.csv")
cat("\n✓ Saved: includes/corn_yield_missing.csv\n")



###################################

corn_wide <- corn_clean %>%
  select(state_alpha, commodity_desc, year, Value) %>%
  pivot_wider(id_cols = state_alpha,names_from = year,names_prefix = "year_",values_from = Value)


write_csv(corn_wide,"corn_wide.csv")



# ============================================
# SECTION 2: Create untidy drought data
# ============================================
# Transform tidy long format → wide format (untidy)
# This mimics how drought data are sometimes published
# Drought severity categories (D0-D4) become separate columns

drought_untidy <- drought_weekly_clean %>%
  # First, ensure we have severity_level and area columns
  # (adjust column names if your source data differs)
  rename(
    StateAbbreviation = state,  # adjust to match your column name
    date = week_date,            # adjust to match
    severity_level = drought_category,  # adjust if needed
    area_sq_miles = area        # adjust if needed
  ) %>%
  # Pivot severity categories to columns (makes untidy)
  pivot_wider(
    names_from = severity_level,
    values_from = area_sq_miles,
    names_prefix = "D"
  )

# Optional: further untidy by spreading some temporal data
# This adds complexity students must address
drought_untidy <- drought_untidy %>%
  group_by(StateAbbreviation, year = year(date)) %>%
  mutate(week_in_year = row_number()) %>%
  # Keep only first 4 weeks to make it more compact (adjustable)
  filter(week_in_year <= 4) %>%
  select(-week_in_year) %>%
  ungroup()

# Verify structure (should have D0, D1, D2, D3, D4 as columns)
glimpse(drought_untidy)

# Save to includes/
write_csv(drought_untidy, "includes/drought_untidy.csv")
cat("✓ Saved: includes/drought_untidy.csv\n")

# ============================================
# SECTION 3-4: Keep clean reference data
# ============================================
# For Sections 3 and 4, students need clean tidy data

# Save tidy weekly drought data (already tidy from source)
write_csv(drought_weekly_clean, "includes/drought_weekly.csv")
cat("✓ Saved: includes/drought_weekly.csv\n")

# Save clean corn yield data for reference
write_csv(corn_clean, "includes/corn_yield_clean.csv")
cat("✓ Saved: includes/corn_yield_clean.csv\n")

# ============================================
# VERIFICATION
# ============================================
# Quick checks to ensure data were created correctly

cat("\n--- VERIFICATION ---\n")

# Check 1: Missingness in corn data
n_missing <- sum(is.na(corn_missing$Value))
n_total <- nrow(corn_missing)
cat("Missing data (corn_yield_missing.csv):\n")
cat("  Total rows:", n_total, "\n")
cat("  Rows with NA:", n_missing, "\n")
cat("  Percentage:", 100 * n_missing / n_total, "%\n\n")

# Check 2: Untidy structure
cat("Untidy structure (drought_untidy.csv):\n")
cat("  Dimensions:", nrow(drought_untidy), "×", ncol(drought_untidy), "\n")
cat("  Has D0-D4 columns:", all(c("D0", "D1", "D2", "D3", "D4") %in% names(drought_untidy)), "\n\n")

# Check 3: Tidy data dimensions
cat("Tidy drought data (drought_weekly.csv):\n")
cat("  Dimensions:", nrow(drought_weekly_clean), "×", ncol(drought_weekly_clean), "\n")
cat("  Date range:", min(drought_weekly_clean$date), "to", max(drought_weekly_clean$date), "\n\n")

cat("Clean corn yield data (corn_yield_clean.csv):\n")
cat("  Dimensions:", nrow(corn_clean), "×", ncol(corn_clean), "\n")
cat("  Year range:", min(corn_clean$Year), "to", max(corn_clean$Year), "\n")
cat("  States:", n_distinct(corn_clean$State), "\n\n")

cat("✓ All lab data files created successfully!\n")
