#=============================#
#====    Analysis Plan    ====#
#=============================#

#====    settings    ====

library(targets)
library(tidyverse)

# List all scripts in R/
script_list <- list.files("R", full.names = TRUE)
# Source scripts
invisible(sapply(script_list, source))

# Options
options(tidyverse.quiet = TRUE)

# Targets options
# targets::tar_option_set()

#====    Workflow    ====

list(
  # Load data
  tar_target(raw_data_file, "data/data.csv", format = "file"),
  tar_target(raw_data, read_csv(raw_data_file)),

  # Data munging
  tar_target(my_data, data_munging(raw_data)),

  #----    Statistical analysis    ----

  # Model
  tar_target(fit, lm(ext_tot ~ ssm_tot * gender * grade, data = my_data)),

  # Post-hoc
  tar_target(ext_emmeans,
             emmeans::emtrends(fit, pairwise ~ gender*grade,
                               var = 'ssm_tot', adjust = "mvt"))
  )

#----
