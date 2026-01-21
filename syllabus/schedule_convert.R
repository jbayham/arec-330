library(yaml)
library(readxl)
library(dplyr)

# Load the CSV
schedule <- read_excel("syllabus/class_schedule.xlsx",sheet = "Sp2026") %>%
  #select(-week) %>%
  mutate(across(-c(week,date), ~ ifelse(is.na(.), "", .)))

# Convert date to character for YAML compatibility
schedule$date <- format(schedule$date, "%Y-%m-%d")

# Convert to list of lists
schedule_list <- apply(schedule, 1, as.list)

# Write to YAML
write_yaml(schedule_list, "_data/schedule.yml")
