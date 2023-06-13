#==========================#
#====    Data Utils    ====#
#==========================#

#----    data_munging    ----#

# Given the raw data, return variables used in the analysis. Munging steps:
# - Categorical variables set to factor
# - Compute questionnaire scores
# - Select relevant variables

data_munging <- function(my_data){
  
  
  res <- my_data %>% 
    mutate(
      
      # Set variables to factor and code levels
      id = factor(id),
      grade = factor(grade, levels = c(3, 4), 
                      labels = c("III", "IV")),
      gender = factor(gender, levels = c(0, 1),
                      labels = c("Male", "Female")),
      
      # Get questionnaire scores
      ssm_tot = get_ssm_score(my_data),
      int_tot = get_sdq_score(my_data, outcome = "int"),
      ext_tot = get_sdq_score(my_data, outcome = "ext")
      ) %>% 
    
    # Select variables used in the analysis
    dplyr::select(id, gender, grade, ssm_tot, int_tot, ext_tot)
  
  
  return(res)
}

#----    get_ssm_score    ----

# Compute the SSM score

get_ssm_score <- function(my_data){
  
  # Reverse SSM items
  item_to_reverse <- paste0("ssm", c(1, 3, 4, 9, 10, 13, 15))
  
  for (col_name in item_to_reverse){
    my_data[, col_name] <- reverse_item(my_data[, col_name], 
                                        min_score = 1, max_socore = 4)
  }
  
  # Score as mean
  all_items <- paste0("ssm", 1:15)
  
  res <- apply(my_data[, all_items], MARGIN =  1, mean)
  
  return(res)
}

#----    get_sdq_score    ----

# Compute the SDQ score

get_sdq_score <- function(my_data, outcome = c("ext", "int")){
  
  outcome <- match.arg(outcome)
  
  # Code SDQ questionnaire reversed items
  sdq_item_to_reverse <- paste0("sdq", c(7, 11, 14, 21, 25))
  
  for (col_name in sdq_item_to_reverse){
    my_data[, col_name] <- reverse_item(my_data[, col_name], 
                                        min_score = 0, max_socore = 2)
  }
  
  # Score as sum
  if(outcome == "int"){
    all_items <- paste0("sdq", c(3,6,8,11,13,14,16,19,23,24))
  } else {
    all_items <- paste0("sdq", c(2,5,7,10,12,15,18,21,22,25))
  }
  
  res <- apply(my_data[, all_items], MARGIN =  1, sum)
  
  return(res)
}

#----    
