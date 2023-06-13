#==================================#
#====    Utilities Targets     ====#
#==================================#

#----    load_glob_env    ----

#' Load Targets in Global Environment
#'
#' Load targets in Global Environment
#'
#' @param ... parameters passed to `targets::tar_load()` function
#' @param store the path to the tergets data store
#'
#' @return The cached value of the target
#'
#' @examples
#' load_glob_env(my_data)
#' my_data
#'

load_glob_env <- function(..., store = targets::tar_config_get("store")){
  targets::tar_load(..., envir = globalenv(), store = store)
}

#----    tar_load_*    ----

#' Load All Targets Objects
#'
#' Load all targets objects
#'
#' @return all cached value of the target
#'
#' @examples
#' tar_load_all()
#'

tar_load_all <- function(store = targets::tar_config_get("store")){

  # targets
  targets <- c(
    "raw_data_file", "raw_data", "my_data", "fit", "ext_emmeans"
  )

  # load
  sapply(targets, load_glob_env, store = store)

  return(cat("Tartgets loaded!"))
  }


tar_load_report <- function(store = targets::tar_config_get("store")){

  # targets
  targets <- c(
    "my_data", "fit", "ext_emmeans"
  )

  # load
  sapply(targets, load_glob_env, store = store)

  return(cat("Tartgets loaded!"))
}
#=============
