#=====================#
#====    Utils    ====#
#=====================#

#----    reverse_item    ----

#' Reverse Items
#'
#' Given the maximum and minimum scores, reverse the item value.
#'
#' @param x numeric vector with the item responses.
#' @param min_score numeric value indicating the minimum item possible value.
#' @param max_socore numeric value indicating the maximum item possible value.
#'
#' @return numeric vector with the reversed item responses.
#'
#' @examples
#' targets::tar_load(raw_data)
#' x <- raw_data$ssm3
#' reverse_item(x, min_score = 1, max_socore = 4)
#'

reverse_item <- function(x, min_score = 1, max_socore = 4){

  diff_score <- max_socore + min_score
  res <- abs(x - diff_score)

  return(res)
}

#----    get_group_summary    ----

#' Get BY Group Summary
#'
#' Get mean and SD of a numeric variable according to group_by
#'
#' @param my_data a tibble with the data
#' @param var unquoted expression indicating the variable of interest.
#' @param group_by character vector indicating the variable to group by.
#'
#' @return a tibble with the grouping variables and mean and SD of the desired
#'   var
#'
#' @examples
#' targets::tar_load(my_data)
#' get_group_summary(my_data, var = ext_tot, group_by = c("gender", "grade"))
#'

get_group_summary <- function(my_data, var, group_by){
  res <- my_data %>%
    group_by(across(all_of(group_by))) %>%
    summarise(mean = mean({{var}}),
              sd = sd({{var}}))

  return(res)
}
