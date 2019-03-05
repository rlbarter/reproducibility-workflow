# File purpose: Do some modeling on the organs dataset
# Author: Rebecca Barter
# Date: 07/31/2018

# source the functions for this file
source("scripts/functions/02_funs_model_data.R")

# load in libraries
library(tidyverse)
library(ranger)
library(recipes)

# load in the clean dataset
organs_train <- read_csv("../data/processed_data/organs_train.csv")
organs_test <- read_csv("../data/processed_data/organs_test.csv")


######################### Pre-process data ###################################

# define a pre-processing recipe that imputes missing values with zero (admittedly a kind of 
# silly thing to do)
recipe <- recipe(total_actual_dd ~ population + reportyear, 
                 data = organs_train) %>%
  step_knnimpute(all_numeric()) %>%
  prep(data = organs_train)

organs_train_preprocessed <- bake(recipe, 
                                  new_data = organs_train) 
# pre-process the testing data
organs_test_preprocessed <- bake(recipe, 
                                 new_data = organs_test) 


############################## Run models #####################################

# run a kind of stupid linear model
lm_simple <- lm(total_actual_dd ~ population + reportyear, 
                data = organs_train_preprocessed)
summary(lm_simple)

# run an equally stupid RF model
rf_simple <- ranger(total_actual_dd ~ population + reportyear, 
                    data = organs_train_preprocessed)
rf_simple

########################### Predict on test set ###############################

lm_predicted <- predict(lm_simple, organs_test_preprocessed)
rf_predicted <- predict(rf_simple, organs_test_preprocessed)

########################### Save model output #################################

model_results <- tibble(true_dd = organs_test_preprocessed$total_actual_dd,
                        lm_fitted_dd = lm_predicted,
                        rf_fitted_dd = rf_predicted$predictions,
                        region = organs_test$region)

write_csv(model_results, "../data/results/model_results.csv")
