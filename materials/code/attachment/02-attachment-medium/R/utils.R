#=====================#
#====    Utils    ====#
#=====================#

#----    reverse_item    ----

# Given the maximum and minimum scores, reverse the item value

reverse_item <- function(x, min_score = 1, max_socore = 4){
  
  diff_score <- max_socore + min_score
  res <- abs(x - diff_score)
  
  return(res)
}

#----    get_group_summary    ----

# Get mean and sd of var according to group_by

get_group_summary <- function(my_data, var, group_by){
  res <- my_data %>% 
    group_by(across(all_of(group_by))) %>% 
    summarise(mean = mean({{var}}),
              sd = sd({{var}}))
  
  return(res)
}
