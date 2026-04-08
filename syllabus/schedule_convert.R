library(yaml)
library(readxl)
library(dplyr)

# Load the CSV
schedule <- read_excel("syllabus/class_schedule.xlsx",sheet = "Sp2026") %>%
  #select(-week) %>%
  mutate(across(-c(week,date), ~ ifelse(is.na(.), "", .)))

# Keep workflow compatible: if module_id is missing from Excel, infer it from topic.
if (!"module_id" %in% names(schedule)) {
  schedule <- schedule %>%
    mutate(
      module_id = case_when(
        grepl("intro", tolower(topic)) ~ "intro",
        grepl("asking the right question", tolower(topic)) ~ "right-questions",
        grepl("processing data part 1", tolower(topic)) ~ "data-processing-1",
        grepl("processing data part 2", tolower(topic)) ~ "data-processing-2",
        grepl("exploratory data analysis", tolower(topic)) ~ "eda",
        grepl("forecasting", tolower(topic)) ~ "forecasting",
        grepl("explanatory data analysis", tolower(topic)) ~ "regression",
        grepl("storytelling", tolower(topic)) ~ "storytelling",
        grepl("choose visual", tolower(topic)) ~ "choosing-visualization",
        TRUE ~ ""
      )
    )
}

# Convert date to character for YAML compatibility
schedule$date <- format(schedule$date, "%Y-%m-%d")

# Convert to list of lists
schedule_list <- apply(schedule, 1, as.list)

# Write to YAML
write_yaml(schedule_list, "_data/schedule.yml")
