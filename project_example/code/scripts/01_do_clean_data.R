# File purpose: Clean the raw organ donation dataset
# Author: Rebecca Barter
# Date: 03/05/2019

# source the functions for this file
source("scripts/functions/01_funs_clean_data.R")

# load in libraries
library(tidyverse)
library(readxl)

# load in the data
organs <- read_xlsx("../data/raw_data/global-organ-donation.xlsx")

# rename columns to be computer friendly
organs_clean <- organs %>% 
  rename_all(~tolower(gsub(" ", "_", .)))

# convert population to numeric
organs_clean <- organs %>% 
  mutate(population = characterToNumeric(population))


