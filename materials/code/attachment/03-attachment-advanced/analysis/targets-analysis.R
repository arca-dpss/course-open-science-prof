#========================#
#====    Analysis    ====#
#========================#

#====    Analysis    ====

# Targets plan
targets::tar_config_set(script = "analysis/targets-workflow.R",
                        store = "analysis/_targets/")

# Check plan
targets::tar_manifest(fields = "command")
targets::tar_visnetwork()

# Run analysis
targets::tar_make()

# End
targets::tar_visnetwork()

#====    Results    ====

# Load all
tar_load_all()

#----    Descriptive Statistics    ----

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

#----    Statistical Analysis    ----

# Model
summary(fit)

# Evaluate effects
car::Anova(fit)

# Post hoc
ext_emmeans

plot_effect_interaction(fit)


#----
