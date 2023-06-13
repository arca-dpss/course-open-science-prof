#==========================#
#====    Data Utils    ====#
#==========================#

#----    data_munging    ----#

#' Data Munging
#' Given the raw data, return variables used in the analysis. Munging steps:
#' - Categorical variables set to factor
#' - Compute questionnaire scores
#' - Select relevant variables used in the analysis
#'
#' @param raw_data a tibble object with the `"data/data.csv"`.
#'
#' @return a tibble object with the data used in the analysis
#'
#' @examples
#' targets::tar_load(raw_data)
#' data_munging(raw_data)
#'

data_munging <- function(raw_data){

  res <- raw_data %>%
    mutate(

      # Set variables to factor and code levels
      id = factor(id),
      grade = factor(grade, levels = c(3, 4),
                      labels = c("III", "IV")),
      gender = factor(gender, levels = c(0, 1),
                      labels = c("Male", "Female")),

      # Get questionnaire scores
      ssm_tot = get_ssm_score(raw_data),
      int_tot = get_sdq_score(raw_data, outcome = "int"),
      ext_tot = get_sdq_score(raw_data, outcome = "ext")
      ) %>%

    # Select variables used in the analysis
    dplyr::select(id, gender, grade, ssm_tot, int_tot, ext_tot)


  return(res)
}

#----    get_ssm_score    ----

#' Compute the SSM Score
#'
#' Given the raw data, compute the total SSM score for each children
#'
#' The total score is given by the average of the items. Higher scores indicate
#' higher levels of security.
#'
#' To construct the final score, it is necessary to invert the scores of items
#' 1, 3, 4, 9, 10, 13, and 15. That is: 1 --> 4; 2 --> 3; 3 --> 2; 4 --> 1.
#'
#' @param raw_data a tibble object with the `"data/data.csv"`.
#'
#' @return a numeric vector with the total SSM score for each children
#'
#' @examples
#' targets::tar_load(raw_data)
#' get_ssm_score(raw_data)
#'

get_ssm_score <- function(raw_data){

  # Reverse SSM items
  item_to_reverse <- paste0("ssm", c(1, 3, 4, 9, 10, 13, 15))

  for (col_name in item_to_reverse){
    raw_data[, col_name] <- reverse_item(raw_data[, col_name],
                                         min_score = 1, max_socore = 4)
  }

  # Score as mean
  all_items <- paste0("ssm", 1:15)

  res <- apply(raw_data[, all_items], MARGIN =  1, mean)

  return(res)
}

#----    get_sdq_score    ----

#' Compute the SDQ Score
#'
#' Given the raw data, compute the externalizing or internalizing scores score
#' for each children.
#'
#' - **Internalizing** = 3, 6, 8, 11, 13, 14, 16, 19, 23, 24
#' - **Externalizing** = 2, 5, 7, 10, 12, 15, 18, 21, 22, 25
#'
#' The total score is given by the sum of the scale items. Higher scores
#' indicate more problems.
#'
#' To construct the final score it is necessary to invert the scores of items 7,
#' 11, 14, 21, 25. That is: 0-->2; 1-->1; 2-->0
#'
#' @param raw_data a tibble object with the `"data/data.csv"`.
#' @param outcome character value indicating whether to compute externalizing
#'   (`"ext"`) or internalizing scores (`"int"`)
#'
#' @return a numeric vector with the total externalizing or internalizing score
#'   for each children
#'
#' @examples
#' targets::tar_load(raw_data)
#' get_sdq_score(raw_data, outcome = "ext")
#'

get_sdq_score <- function(raw_data, outcome = c("ext", "int")){

  outcome <- match.arg(outcome)

  # Code SDQ questionnaire reversed items
  sdq_item_to_reverse <- paste0("sdq", c(7, 11, 14, 21, 25))

  for (col_name in sdq_item_to_reverse){
    raw_data[, col_name] <- reverse_item(raw_data[, col_name],
                                         min_score = 0, max_socore = 2)
  }

  # Score as sum
  if(outcome == "int"){
    all_items <- paste0("sdq", c(3,6,8,11,13,14,16,19,23,24))
  } else {
    all_items <- paste0("sdq", c(2,5,7,10,12,15,18,21,22,25))
  }

  res <- apply(raw_data[, all_items], MARGIN =  1, sum)

  return(res)
}

#----
