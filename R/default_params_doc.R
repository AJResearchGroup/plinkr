#' This function does nothing. It is intended to inherit is parameters'
#' documentation.
#' @param add_noweb add the \code{--noweb} option, which prevents
#' that PLINK will check if it is in its latest version.
#' By default, this value is set to true,
#' hence plinkr will skip this check.
#' Use \link{get_plink_version} to get the current PLINK version.
#' @param assoc_filename name of a PLINK \code{.assoc} file
#' Use \link{read_plink_assoc_file} to read a PLINK \code{.assoc} file.
#' @param assoc_qt_params parameters to do an association analysis
#' for a quantitative trait (i.e. using \link{assoc_qt}),
#' as can be created by \link{create_assoc_qt_params}
#' @param example_filename name of the example file
#' @param log_filename name of a PLINK \code{.log} file
#' @param maf minor allele frequency
#' @param map_filename name of a PLINK \code{.map} file
#' Use \link{read_plink_map_file} to read a PLINK \code{.map} file.
#' @param map_table a table obtained by reading a PLINK \code{.map} file
#' Use \link{read_plink_map_file} to read a PLINK \code{.map} file.
#' @param n_individuals number of individuals
#' @param ped_filename name of a PLINK \code{.ped} file.
#' Use \link{read_plink_ped_file} to read a PLINK \code{.ped} file.
#' @param ped_table a table obtained by reading a PLINK \code{.ped} file
#' Use \link{read_plink_ped_file} to read a PLINK \code{.ped} file.
#' @param phenotype_filename name of a raw phenotype file.
#' Use \link{read_plink_phenotype_file} to read a raw phenotype file.
#' @param phenotype_table a table of phenotypes.
#' Use \link{read_plink_phenotype_file} to read a phenotype file.
#' @param plink_folder folder where PLINK is installed
#' @param plink_version version of PLINK, e.g. \code{"1.7"}
#' @param plink_versions one or more versions of PLINK,
#' e.g. as can be obtained using \link{get_plink_versions}
#' @param qassoc_filename name of a PLINK \code{.qassoc} file
#' Use \link{read_plink_qassoc_file} to read a PLINK \code{.qassoc} file.
#' @param sim_filename name of a PLINK \code{.sim} file
#' @param simfreq_filename name of a PLINK \code{.simfreq} file
#' @param simulate_qt_params the parameters for a quantitative
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
  assoc_qt_params,
  example_filename,
  log_filename,
  maf,
  map_filename,
  map_table,
  n_individuals,
  ped_filename,
  ped_table,
  phenotype_filename,
  phenotype_table,
  plink_folder,
  plink_version,
  plink_versions,
  qassoc_filename,
  sim_filename,
  simfreq_filename,
  simulate_qt_params,
  temp_sim_filename,
  url,
  verbose
) {
  # Nothing
}
