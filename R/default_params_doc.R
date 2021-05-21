#' This function does nothing. It is intended to inherit is parameters'
#' documentation.
#' @param add_noweb add the \code{--noweb} option, which prevents
#' that PLINK will check if it is in its latest version.
#' By default, this value is set to true,
#' hence plinkr will skip this check.
#' Use \link{get_plink_version} to get the current PLINK version.
#' @param assoc_filename name of a PLINK \code{.assoc} file
#' Use \link{read_plink_assoc_file} to read a PLINK \code{.assoc} file.
#' @param example_filename name of the example file
#' @param log_filename name of a PLINK \code{.log} file
#' @param map_filename name of a PLINK \code{.map} file
#' Use \link{read_plink_map_file} to read a PLINK \code{.map} file.
#' @param n_individuals number of individuals
#' @param ped_filename name of a PLINK \code{.ped} file.
#' Use \link{read_plink_ped_file} to read a PLINK \code{.ped} file.
#' @param phenotype_filename name of a raw phenotype file.
#' Use \link{read_plink_phenotype_file} to read a raw phenotype file.
#' @param plink_folder folder where PLINK is installed
#' @param qassoc_filename name of a PLINK \code{.qassoc} file
#' Use \link{read_plink_qassoc_file} to read a PLINK \code{.qassoc} file.
#' @param sim_filename name of a PLINK \code{.sim} file
#' @param simfreq_filename name of a PLINK \code{.simfreq} file
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
  add_noweb,
  assoc_filename,
  example_filename,
  log_filename,
  map_filename,
  n_individuals,
  ped_filename,
  phenotype_filename,
  plink_folder,
  qassoc_filename,
  sim_filename,
  simfreq_filename,
  sim_qt_params,
  temp_sim_filename,
  url,
  verbose
) {
  # Nothing
}
