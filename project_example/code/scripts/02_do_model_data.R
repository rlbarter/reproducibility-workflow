# File purpose: Combine the raw datasets that are currently stored seperately
#     across years and across sheets into single data frames. 
#     These data frames will be stored 
# Author: Rebecca Barter
# Date: 07/31/2018

# note: these files are large. Reading them in and checking them takes a few minutes. 
# Be patient. Make some tea.

# source the functions for this file
source("functions/01_funs_combine_year_separated_data.R")

# load in libraries
library(readxl)
library(tidyverse)

# define the path to be relative to this R script 
# working directory should be set to the location of this R script
processed_data_path <- "../data/processed_data/01_combined_data/"
original_data_path <- "../data/Surgical encounters/"


##################################### Labs ####################################

# combine the individual year lab data files into a single long-form data frame
labs <- combineYears("Labs.xlsx") 

# check that the individual files exist entirely in the lab files
checkDataMatches("Labs.xlsx", labs) # will print statements

# save this combined dataset
write.csv(labs, paste0(processed_data_path, "combined_labs.csv"))

##################################### Meds ####################################

# combine the individual year medication data files into a single long-form data frame
meds <- combineYears("Meds.xlsx")

# check that the individual year excel files match the filtered combined df 
checkDataMatches("Meds.xlsx", meds) # will print statements

# save this combined dataset
write.csv(meds, paste0(processed_data_path, "combined_meds.csv"))

################################ Previous diagnoses ###########################

# combine the individual year diagnosis data files into a single long-form data frame
diagnoses <- combineYears("Previous_dx.xlsx")

# check that the individual year excel files match the filtered combined df 
checkDataMatches("Previous_dx.xlsx", diagnoses) # will print statements

# save this combined dataset
write.csv(diagnoses, paste0(processed_data_path, "combined_diagnoses.csv"))

############################ Chronic conditions ###############################

# combine the individual year chronic conditions data files into a single long-form data frame
chronic_conditions <- combineYears("Prob_List.xlsx")

# check that the individual year excel files match the filtered combined df 
checkDataMatches("Prob_List.xlsx", chronic_conditions) # will print statements

# save this combined dataset
write.csv(chronic_conditions, paste0(processed_data_path, "combined_chronic_conditions.csv"))

################################## Vitals ####################################

# combine the individual year chronic conditions data files into a single long-form data frame
vitals <- combineYears("Vitals.xlsx")

# check that the individual year excel files match the filtered combined df 
checkDataMatches("Vitals.xlsx", vitals) # will print statements
# Should NOT expect that 2017 will match because we add the extra dataset when 
# loading the combined data

# save this combined dataset
write.csv(vitals, paste0(processed_data_path, "combined_vitals.csv"))

#################### Share (all denominator data) #############################

# combine the individual year encounters data files into a single long-form data frame
surgical_encounters <- combineYears("share_7.13.2018.xls")

# check that the individual year excel files match the filtered combined df 
checkDataMatches("share_7.13.2018.xls", surgical_encounters) # will print statements

# save this combined dataset
write.csv(surgical_encounters, paste0(processed_data_path, "combined_surgical_encounters.csv"))
