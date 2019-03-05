# File purpose: Clean the raw organ donation dataset
# Author: Rebecca Barter
# Date: 03/05/2019

# load in libraries
library(tidyverse)
library(testthat)

# do not run this file before running 01_do_clean_data.R to produce the 
# cleaned dataset
if (!file.exists("../data/processed_data/organs_clean.csv")) {
  stop("Run `01_do_clean_data.R` first!")
}

# load in the data
organs_clean <- read_csv("../data/processed_data/organs_clean.csv")

# split into training, testing and validation data
# ensure that all data from the same country are kept in the same group
# identify all countries
countries <- organs_clean %>% distinct(country) 
# randomly select 60% of countries to be training countries
train_countries <- countries %>%
  sample_frac(0.6) %>%
  pull(country)
# of the remaining countries, randomly choose half of them to be in the test set
test_countries <- countries %>%
  filter(!(country %in% train_countries)) %>%
  sample_frac(0.5) %>%
  pull(country)
# put the remaining countries in the validation set  
val_countries <- countries %>%
  filter(!(country %in% c(train_countries, test_countries))) %>%
  pull(country)

# check that there is no overlap between countries
# if there is no output of the following functions, then we are good!
expect_equal(sum(train_countries %in% test_countries), 0)
expect_equal(sum(train_countries %in% val_countries), 0)
expect_equal(sum(test_countries %in% val_countries), 0)

# save the training, testing and validation datasets separately
organs_train <- organs_clean %>%
  filter(country %in% train_countries)
organs_test <- organs_clean %>%
  filter(country %in% test_countries)
organs_val <- organs_clean %>%
  filter(country %in% val_countries)

# save the organs_clean data frame
write_csv(organs_train, "../data/processed_data/organs_train.csv")
write_csv(organs_test, "../data/processed_data/organs_test.csv")
write_csv(organs_val, "../data/processed_data/organs_val.csv")

# remove the original clean dataset
file.remove("../data/processed_data/organs_clean.csv")
