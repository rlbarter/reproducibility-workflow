# File purpose: Clean the raw organ donation dataset
# Author: Rebecca Barter
# Date: 03/05/2019

# source the functions for this file
source("scripts/functions/01_funs_clean_data.R")

# load in libraries
library(tidyverse)

# load in the data
organs <- read_csv("../data/raw_data/global-organ-donation.csv")

# rename columns to be computer friendly
organs_clean <- organs %>% 
  rename_all(~tolower(gsub(" ", "_", .)))

# convert population to numeric
organs_clean <- organs_clean %>% 
  mutate(population = characterToNumeric(population))

# remove countries with no donors reported for any year
organs_clean <- organs_clean %>%
  # Define a variable repeated across all years for each country that records
  # for how many years the country reported deceased donor counts
  group_by(country) %>%
  mutate(years_reported = sum(!is.na(total_actual_dd))) %>%
  ungroup() %>%
  # keep only countries that reported at least one deceased donor count
  filter(years_reported > 0) %>%
  # remove the years_reported variable
  select(-years_reported)

write_csv(organs_clean, "../data/processed_data/organs_clean.csv")
