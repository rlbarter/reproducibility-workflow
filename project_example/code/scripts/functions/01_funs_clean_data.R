# File purpose: functions that are useful for data cleaning
# Author: Rebecca Barter
# Date: 03/05/2019


#' Convert a character number with commas to a numeric
#'
#' @param x the character number
#'
#' @return the corresponding numeric value
#' @export
#'
#' @examples
#' characterToNumeric("1,247")
#' 
characterToNumeric <- function(x) {
  gsub(",", "", x) %>%
    as.numeric
}
