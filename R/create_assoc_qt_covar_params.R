#' Create parameters for the \link{assoc_qt_covar} function
#'
#' Create parameters to detect associations with quantitative traits
#' and covariates
#' (using \link{assoc_qt_covar}).
#' Use \link{create_test_assoc_qt_covar_params})
#' to create a set of parameters
#' that is used in testing.
#'
#' @note This function is named after the \code{--assoc} and
#' \code{--covar} \code{PLINK} flags.
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
create_assoc_qt_covar_params <- function(
  ped_table,
  map_table,
  phe_table,
  cov_table,
  maf = get_lowest_maf(),
  base_input_filename = file.path(get_plinkr_tempfilename(), "assoc_input"),
  base_output_filename = file.path(get_plinkr_tempfilename(), "assoc_output")
) {
  plinkr::check_ped_table(ped_table = ped_table)
  plinkr::check_map_table(map_table = map_table)
  plinkr::check_phe_table(phe_table = phe_table)
  plinkr::check_cov_table(cov_table = cov_table)
  plinkr::check_maf(maf = maf)
  plinkr::check_base_input_filename(base_input_filename = base_input_filename)
  plinkr::check_base_output_filename(base_output_filename)
  list(
    ped_table = ped_table,
    map_table = map_table,
    phe_table = phe_table,
    cov_table = cov_table,
    maf = maf,
    base_input_filename = base_input_filename,
    base_output_filename = base_output_filename
  )
}
