# File purpose: define functions to load and save versions of the "Surgical 
# Encounters" files that combines all years and sheets into single data frames
# Author: Rebecca Barter
# Date: 07/31/2018

# load in libraries
library(readxl)
library(tidyverse)

################## Functions load and check combined data #####################

combineYears <- function(filename, 
                         original_data_path = "../data/Surgical encounters/") {
  # A function to combine the data across all years for the specified file
  # Args:
  #   filename: one of "Labs.xlsx", "Meds.xlsx", "Previous_dx.xlsx", 
  #   "Prob_List.xlsx", "Vitals.xlsx"
  
  # throw error if nonexistent filename provided
  if (!(filename %in% c("Labs.xlsx", "Meds.xlsx", "Previous_dx.xlsx", 
                      "Prob_List.xlsx", "Problem_List.xlsx", "Vitals.xlsx",
                      "share_7.13.2018.xls"))) {
    stop(paste0('filename must be one of "Labs.xlsx", "Meds.xlsx",', 
                '"Previous_dx.xlsx", "Prob_List.xlsx", "Problem_List.xlsx",
                "Vitals.xlsx", "share_7.13.2018.xls"'))
  }

  # combine all years into a single data frame
  combined_data <- map_df(2014:2017, function(year) {
    
    # deal with the problem_list name inconsistency
    if (filename %in% c("Prob_List.xlsx", "Problem_List.xlsx")) {
      if (year %in% c(2014, 2015)) {
        filename <- "Prob_List.xlsx"
      } else {
        filename <- "Problem_List.xlsx"
      }
    }
    if (filename == "share_7.13.2018.xls") {
      if (year == 2015) {
        filename <- paste0(filename, "x")
      }
    }
    # store path to data
    full_path <- paste0(original_data_path, year,  
                        "/Q340954_denom_", 
                        year, "_", filename)
    # list all sheets in the spreadsheet
    sheets <- excel_sheets(full_path)
    # remove the SQL sheet
    sheets <- sheets[!(sheets %in% c("Key", "SQL"))]
    # only the first sheet has column names
    var_names <- colnames(read_excel(full_path, sheet = 1, 
                                     n_max = 1))
    # combine all sheets into a single data fram
    combined_sheets <- map_df(sheets, function(sheet) {
      df <- data.frame(year = year, # record year as a column
                 read_excel(full_path, sheet = sheet))
      colnames(df) <- c("year", var_names)
      return(df)
    })
    return(combined_sheets)

  })
  # for some reason some of the 2017 vitals data is in a separate file!
  if (filename == "Vitals.xlsx") {
    print("adding extra 2017 Vitals data")
    # load in the separate vitals file
    vitals_2 <- data.frame(year = 2017,
                           read_excel(paste0(original_data_path, "2017",  
                                  "/Q340954_denom_2017_", 
                                  "Vitals_2.xlsx")))
    # add to the combined data
    combined_data <- rbind(combined_data, vitals_2)
  }
  
  return(combined_data)
}


checkDataMatches <- function(filename, combined_data, 
                             original_data_path = "../data/Surgical encounters/") {
  # check that the combined dataset filtered to individual years has the same
  # number of rows as the individual year files 
  # Args:
  #   filename: one of "Labs.xlsx", "Meds.xlsx", "Previous_dx.xlsx", 
  #     "Prob_List.xlsx", "Vitals.xlsx", "share_7.13.2018.xls"
  #   combined_data: a data frame as defined by combineYears
  

  # walk across each year and check number of rows
   walk(2014:2017, function(year) {
     # deal with the problem list name inconsistency
     if (filename %in% c("Prob_List.xlsx", "Problem_List.xlsx")) {
       if (year %in% c(2014, 2015)) {
         filename <- "Prob_List.xlsx"
       } else {
         filename <- "Problem_List.xlsx"
       }
     }
     if (filename == "share_7.13.2018.xls") {
       if (year == 2015) {
         filename <- paste0(filename, "x")
       }
     }
     full_path <- paste0(original_data_path, year,  
                         "/Q340954_denom_", 
                         year, "_", filename)
     # list all sheets in the spreadsheet
     sheets <- excel_sheets(full_path)
     # remove the SQL sheet
     sheets <- sheets[!(sheets %in% c("Key", "SQL"))]
     # combine all sheets for the specified year into a single data frame
     year_data <- map_df(sheets, function(sheet) {
       data.frame(year = year,
                  read_excel(full_path, sheet = sheet))
     })     
     
     # compare the number of rows of the loaded data and the excel file
     if (nrow(year_data) == sum(combined_data$year == year)) {
       print(paste0(year, "_", filename, " and combined data frame filtered to ", 
                    year, " both have ", nrow(year_data), " rows."))
     } else {
       print(paste0(year, "_", filename, " and combined data frame filtered to ",
                    year, " dimensions DO NOT match: ", year, "_", filename,
                    " has ", nrow(year_data), 
                    " rows, and combined data frame filtered to ", year, 
                    " has ", sum(combined_data$year == year), " rows."))
     }
     })
}
  