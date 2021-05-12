#' This function does nothing. It is intended to inherit is parameters'
#' documentation.
#' @param n_individuals number of individuals
#' @param plink_folder folder where PLINK is installed
#' @param sim_qt_params the parameters for a quantitative
#'   traits simulation, as can be created by
#'   \link{create_sim_qt_params}
#' @param temp_sim_filename temporary file to store simulation
#'   parameters, which is a PLINK \code{.sim} file
#' @param url PLINK download URL
#' @param verbose set to TRUE for more output
#' @author Richèl J.C. Bilderbeek
#' @note This is an internal function, so it should be marked with
#'   \code{@noRd}. This is not done, as this will disallow all
#'   functions to find the documentation parameters
default_params_doc <- function(
  n_individuals,
  plink_folder,
  sim_qt_params,
  temp_sim_filename,
  url,
  verbose
) {
  # Nothing
}
