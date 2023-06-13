#===================================#
#====    Attachment Analysis    ====#
#===================================#

# 01 Import Data
# 02 Data Munging
# 03 Descriptive Analysis
# 04 Statistical Analysis

#----    Settings    ----

library(tidyverse)

# ggplot theme
theme_set(theme_bw())

# Load custom functions
my_scripts <- list.files("R", full.names = TRUE)
invisible(lapply(my_scripts, source))

#----    01 Import Data    ----

data_raw <- read_csv("data/data.csv")
str(data_raw)

#----    02 Data Munging    ----

my_data <- data_munging(data_raw)
str(my_data)

# Save munged data
save(my_data, file = "outputs/my_data.rda")

#----    03 Descriptive Statistics    ----

# Summary
summary(my_data)

# Number of children according to gender and grade
table(my_data$gender, my_data$grade) 

# Externalizing problems
plot_bar(my_data, var = ext_tot)
sd(my_data$ext_tot)

# Externalizing problems according to gender and grade
get_group_summary(my_data, var = ext_tot, group_by = c("gender", "grade"))
plot_bar(my_data, var = ext_tot) +
  facet_grid(grade~gender)

# Relation externalizing problems and mother security
plot_scatter(my_data, x = ssm_tot, y = ext_tot) +
  facet_grid(grade~gender)

#----    04 Statistical Analysis    ----

# Fit the model
fit <-lm(ext_tot ~ ssm_tot * gender * grade, data = my_data)
save(fit, file = "outputs/fit.rda")

summary(fit)

# Evaluate effects
car::Anova(fit)

# Post hoc 
ext_emmeans <- emmeans::emtrends(fit, pairwise ~ gender*grade, var = 'ssm_tot', adjust = "mvt")
save(ext_emmeans, file = "outputs/ext_emmeans.rda")

ext_emmeans

plot_effect_interaction(fit)



