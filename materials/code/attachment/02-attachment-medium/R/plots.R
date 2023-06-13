#=====================#
#====    Plots    ====#
#=====================#

#----    my_labeller    ----

# Given the variable name get the corresponding label to use in plots

my_labeller <- Vectorize(vectorize.args = "x",
                         FUN = function(x) {
                           switch(as.character(x),
                                  "ssm_tot" = "Mother Security",
                                  "ext_tot" = "Externalizing Problems",
                                  "int_tot" = "Internalizing Problems",
                                  "gender" = "Gender",
                                  "grade" = "Grde",
                                  x)})


#----    plot_bar    -----

# Bar plot

plot_bar <- function(my_data, var, fill = "firebrick"){
  
  var_lab <- my_labeller(deparse(substitute(var)))
  
  ggplot(my_data) +
    geom_bar(aes(x = {{var}}), fill = fill, alpha = .8) +
    labs(x = var_lab,
         y = "Count")
}

#----    plot_scatter    ----

# Scatter plot

plot_scatter <- function(my_data, x, y){
  
  x_lab <- my_labeller(deparse(substitute(x)))
  y_lab <- my_labeller(deparse(substitute(y)))
  
  ggplot(my_data) +
    geom_jitter(aes(x = {{x}}, y = {{y}}), width= .01, height = .2) +
    labs(x = x_lab,
         y = y_lab)
}

#----    plot_effect_interaction    ----

# Given the model fit, plot the interaction ssm_tot * gender * grade

plot_effect_interaction <- function(fit){
  data_plot <- effects::effect("ssm_tot * gender * grade", fit, xlev = 20) %>% 
    as.data.frame()
  
  x_lab <- my_labeller("ssm_tot")
  y_lab <- my_labeller("ext_tot")
  legend_lab <- my_labeller("gender")
  
  ggplot(data_plot) +
    geom_ribbon(aes(x= ssm_tot, ymin = lower, ymax=upper, fill = gender), alpha = .4) +
    geom_line(aes(x= ssm_tot, y = fit, color = gender), size = 1.2) +
    geom_rug(data = my_data[my_data$gender == "Male",],
             aes(x= ssm_tot, color = gender, y = ext_tot), size = 1.2, alpha = .7,
             position = position_jitter(width = .02, height = 0), sides = "t") +
    geom_rug(data = my_data[my_data$gender == "Female",],
             aes(x= ssm_tot, color = gender, y = ext_tot), size = 1.2, alpha = .7,
             position = position_jitter(width = .02, height = 0), sides = "b") +
    facet_grid(grade~.) +
    labs(x = x_lab,
         y = y_lab,
         legend = legend_lab) +
    theme(legend.position = "top")
}
