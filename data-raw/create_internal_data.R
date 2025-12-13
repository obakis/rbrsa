# Script to create internal package data from CSV files
# Run this once to regenerate R/sysdata.rda

library(usethis)

# Load all CSV files
finturk_cities =  read.csv(file.path("data-raw", "cities.csv"),
                           fileEncoding = "UTF-8",
                   stringsAsFactors = FALSE)
groups <- read.csv(file.path("data-raw", "groups.csv"), fileEncoding = "UTF-8",
                   stringsAsFactors = FALSE)
bddk_tables <- read.csv(file.path("data-raw", "bddk_tables.csv"),
                           fileEncoding = "UTF-8",
                           stringsAsFactors = FALSE)
finturk_tables <- read.csv(file.path("data-raw", "finturk_tables.csv"),
                             fileEncoding = "UTF-8",
                             stringsAsFactors = FALSE)
bddk_groups <- groups[groups$source == "bddk", c("grup_kod", "name_tr", "name_en")]
finturk_groups <- groups[groups$source == "finturk", c("grup_kod", "name_tr", "name_en")]

# Create metadata list
bddk_internal_metadata <- list(
  bddk_groups = bddk_groups,
  finturk_groups = finturk_groups,
  bddk_tables = bddk_tables,
  finturk_tables = finturk_tables,
  finturk_cities = finturk_cities
)

# Save as internal data
usethis::use_data(
  bddk_groups,
  finturk_groups,
  bddk_tables,
  finturk_tables,
  finturk_cities,
  bddk_internal_metadata,
  internal = TRUE,
  overwrite = TRUE
)

cat("Internal data saved to R/sysdata.rda\n")
