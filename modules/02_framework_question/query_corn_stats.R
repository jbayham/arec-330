# ============================================================================
# USDA NASS QuickStats Corn Statistics Query
# ============================================================================
#
# Purpose: Query corn statistics (average, total harvest, and yield) from the
#          USDA National Agricultural Statistics Service (NASS) using the
#          rnassqs R package and the Quick Stats API.
#
# Requirements:
#   - rnassqs package installed from CRAN or GitHub
#   - Valid NASS API key (https://quickstats.nass.usda.gov/api/)
#   - API key stored in .Renviron file as: NASSQS_TOKEN="your_api_key_here"
#
# Reference: https://docs.ropensci.org/rnassqs/
#
# ============================================================================


# ============================================================================
# 1. SETUP AND AUTHENTICATION
# ============================================================================

# Load the rnassqs library
# This package provides functions to query the USDA NASS Quick Stats API
library(rnassqs)

# Optional: Load tidyverse for data manipulation and visualization
library(tidyverse)
library(dplyr)
library(ggplot2)

# Authenticate with the NASS API using your API key
# The API key should be stored in your .Renviron file as:
#   NASSQS_TOKEN="your_api_key_here"
#
# If your key is already in .Renviron, this will automatically load it.
# Alternatively, you can authenticate directly in the console with:
#   nassqs_auth(key = "your_api_key_here")
#
# Note: The NASSQS_TOKEN environment variable is used internally by rnassqs.
# You can verify it's set with: Sys.getenv("NASSQS_TOKEN")

# Verify authentication is working by checking if the token is set
if (Sys.getenv("NASSQS_TOKEN") == "") {
  stop("NASSQS_TOKEN not set. Please add your API key to .Renviron or use nassqs_auth()")
}


# ============================================================================
# 2. EXPLORE AVAILABLE PARAMETERS
# ============================================================================

# The NASS API has many parameters. Before querying, it's useful to explore
# what values are available for key parameters.

# Example: Get unique values for statistic categories (e.g., "YIELD", "AREA", etc.)
cat("\nAvailable Statistic Categories:\n")
print(nassqs_param_values("statisticcat_desc"))

# Example: Get unique values for geography/state
cat("\nExample State Codes:\n")
print(head(nassqs_param_values("state_alpha"), 10))


# ============================================================================
# 3. QUERY CORN STATISTICS: YIELD
# ============================================================================

# Retrieve corn yield data for all states from 2015 onwards
# The nassqs_yields() function is a convenience wrapper for querying yield data
# It automatically filters for statisticcat_desc = "YIELD"

cat("\n--- Querying Corn Yield Data ---\n")

# Define parameters for the yield query
# Key parameters:
#   commodity_desc: Type of crop (must match NASS naming conventions)
#   year__GE: Year greater than or equal to (2015 and later)
#   Note: The "__GE" suffix means "greater than or equal to"
#         Other operators: __LE (<=), __LT (<), __GT (>), __NE (!=)

yield_params <- list(
  commodity_desc = "CORN",
  year__GE = 2000,
  prodn_practice_desc = "ALL PRODUCTION PRACTICES",
  source_desc = "SURVEY",
  agg_level_desc = "STATE",
  reference_period_desc = "YEAR",
  statisticcat_desc = c("YIELD"),
  #state_alpha = "CO",
  util_practice_desc = "GRAIN"
  # Additional optional parameters:
  # state_alpha = "IA",  # Uncomment to filter by specific state(s)
  # agg_level_desc = "STATE"  # Aggregation level (COUNTY, STATE, etc.)
)

# Get record count before downloading to ensure it's manageable
# (NASS API limits GET requests to 50,000 records)
yield_count <- nassqs_record_count(yield_params)
#cat("Estimated records for yield query:", yield_count, "\n")

# Download yield data
corn_yield <- nassqs(yield_params)

corn_yield_sub <- corn_yield %>%
  select(commodity_desc, year, state_alpha, state_name, Value, unit_desc, `CV (%)`)

write_csv(corn_yield,"usda_nass_corn_yield_2000-2025.csv")
# ============================================================================
# 4. QUERY CORN STATISTICS: AREA HARVESTED
# ============================================================================

# Retrieve area harvested for corn
# The nassqs_acres() function is a convenience wrapper for area data
# By default, it retrieves "AREA HARVESTED" data

cat("\n--- Querying Corn Area Harvested Data ---\n")

# Define parameters for the area harvested query
area_params <- list(
  commodity_desc = "CORN",
  year__GE = 2022,
  state_alpha = "CO"
)

# Get record count
area_count <- nassqs_record_count(area_params)
cat("Estimated records for area query:", area_count, "\n")

# Download area harvested data using the convenience function
# area = "AREA HARVESTED" specifies we want harvested area (vs. planted area)
corn_area <- nassqs_acres(area_params, area = "AREA HARVESTED")

# Display basic information about the results
cat("Area data structure:\n")
print(head(corn_area, n = 3))
cat("Dimensions:", nrow(corn_area), "rows ×", ncol(corn_area), "columns\n")


# ============================================================================
# 5. QUERY CORN STATISTICS: TOTAL HARVEST (PRODUCTION)
# ============================================================================

# Retrieve total corn production using a direct API query with nassqs()
# We'll use statisticcat_desc = "PRODUCTION" for total harvest values

cat("\n--- Querying Corn Production (Total Harvest) Data ---\n")

# Define parameters for the production query
production_params <- list(
  commodity_desc = "CORN",
  year__GE = 2015,
  statisticcat_desc = "PRODUCTION"
)

# Get record count
production_count <- nassqs_record_count(params = production_params)
cat("Estimated records for production query:", production_count, "\n")

# Download production data using the general nassqs() function
# This returns total production values for the specified parameters
corn_production <- nassqs(production_params)

# Display basic information about the results
cat("Production data structure:\n")
print(head(corn_production, n = 3))
cat("Dimensions:", nrow(corn_production), "rows ×", ncol(corn_production), "columns\n")


# ============================================================================
# 6. DATA PROCESSING AND AGGREGATION
# ============================================================================

# Combine and summarize the data for analysis

cat("\n--- Aggregating Data ---\n")

# Extract and rename key columns for yield data for easier analysis
yield_summary <- corn_yield %>%
  select(
    year,
    state_alpha,
    state_name,
    Value,       # The actual yield value
    unit_desc    # Unit description (should be "BU / ACRE" for corn yield)
  ) %>%
  rename(
    yield = Value,
    unit = unit_desc
  ) %>%
  # Convert yield to numeric (handles potential text values)
  mutate(yield = as.numeric(yield)) %>%
  # Remove rows with missing yield values
  filter(!is.na(yield))

# Extract and summarize area harvested data
area_summary <- corn_area %>%
  select(
    year,
    state_alpha,
    state_name,
    Value,       # The actual area value
    unit_desc    # Unit description (should be "ACRES")
  ) %>%
  rename(
    area_harvested = Value,
    unit = unit_desc
  ) %>%
  mutate(area_harvested = as.numeric(area_harvested)) %>%
  filter(!is.na(area_harvested))

# Extract and summarize production data
production_summary <- corn_production %>%
  select(
    year,
    state_alpha,
    state_name,
    Value,       # The actual production value
    unit_desc    # Unit description (should be "BU" for bushels)
  ) %>%
  rename(
    production = Value,
    unit = unit_desc
  ) %>%
  mutate(production = as.numeric(production)) %>%
  filter(!is.na(production))


# ============================================================================
# 7. SUMMARY STATISTICS BY STATE AND YEAR
# ============================================================================

# Calculate summary statistics across all states for each year

cat("\n--- Summary Statistics by Year ---\n")

# National yield averages
yield_by_year <- yield_summary %>%
  group_by(year) %>%
  summarise(
    avg_yield = mean(yield, na.rm = TRUE),
    min_yield = min(yield, na.rm = TRUE),
    max_yield = max(yield, na.rm = TRUE),
    sd_yield = sd(yield, na.rm = TRUE),
    n_states = n(),
    .groups = 'drop'
  ) %>%
  arrange(year)

print("Average Corn Yield by Year (BU/ACRE):")
print(yield_by_year)

# National area harvested totals
area_by_year <- area_summary %>%
  group_by(year) %>%
  summarise(
    total_area = sum(area_harvested, na.rm = TRUE),
    avg_area = mean(area_harvested, na.rm = TRUE),
    n_states = n(),
    .groups = 'drop'
  ) %>%
  arrange(year)

print("Total and Average Corn Area Harvested by Year (ACRES):")
print(area_by_year)

# National production totals
production_by_year <- production_summary %>%
  group_by(year) %>%
  summarise(
    total_production = sum(production, na.rm = TRUE),
    avg_production = mean(production, na.rm = TRUE),
    n_states = n(),
    .groups = 'drop'
  ) %>%
  arrange(year)

print("Total and Average Corn Production by Year (BUSHELS):")
print(production_by_year)


# ============================================================================
# 8. OPTIONAL: VISUALIZATIONS
# ============================================================================

# Create simple visualizations of the corn statistics trends

# Time series plot of national average yield
yield_plot <- yield_by_year %>%
  ggplot(aes(x = year, y = avg_yield)) +
  geom_line(color = "darkgreen", size = 1) +
  geom_point(color = "darkgreen", size = 3) +
  labs(
    title = "National Average Corn Yield Over Time",
    x = "Year",
    y = "Average Yield (BU/ACRE)",
    subtitle = "Data source: USDA NASS Quick Stats"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 14, face = "bold"),
    axis.text = element_text(size = 11)
  )

print(yield_plot)

# Time series plot of total area harvested
area_plot <- area_by_year %>%
  ggplot(aes(x = year, y = total_area / 1e6)) +  # Convert to millions of acres
  geom_line(color = "goldenrod", size = 1) +
  geom_point(color = "goldenrod", size = 3) +
  labs(
    title = "Total U.S. Corn Area Harvested Over Time",
    x = "Year",
    y = "Total Area (Millions of Acres)",
    subtitle = "Data source: USDA NASS Quick Stats"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 14, face = "bold"),
    axis.text = element_text(size = 11)
  )

print(area_plot)


# ============================================================================
# 9. OPTIONAL: EXPORT DATA
# ============================================================================

# Save the processed summaries to CSV files for use in other applications

# Write yield summary to CSV
write.csv(
  yield_by_year,
  file = "corn_yield_summary.csv",
  row.names = FALSE
)
cat("Saved: corn_yield_summary.csv\n")

# Write area summary to CSV
write.csv(
  area_by_year,
  file = "corn_area_summary.csv",
  row.names = FALSE
)
cat("Saved: corn_area_summary.csv\n")

# Write production summary to CSV
write.csv(
  production_by_year,
  file = "corn_production_summary.csv",
  row.names = FALSE
)
cat("Saved: corn_production_summary.csv\n")


# ============================================================================
# 10. NOTES AND BEST PRACTICES
# ============================================================================

# - API Rate Limiting: The NASS API may have rate limits. If you receive
#   errors, try adding pauses between queries with Sys.sleep().
#
# - Record Limit: Each API query is limited to 50,000 records. The
#   nassqs_record_count() function helps you check before querying.
#
# - Parameter Case Sensitivity: Parameter names are NOT case-sensitive
#   ("CORN", "corn", "Corn" all work), but values may be. Check available
#   values with nassqs_param_values().
#
# - Aggregation Levels: You can filter by agg_level_desc for different
#   geographic levels (NATIONAL, STATE, COUNTY, etc.)
#
# - Additional Statistics: Beyond yield, area, and production, explore other
#   available statistics with nassqs_param_values("statisticcat_desc")
#
# - Missing Data: Some state-year combinations may have missing data in NASS.
#   Always check your results for missing values (NA).

cat("\n✓ Script completed successfully!\n")
