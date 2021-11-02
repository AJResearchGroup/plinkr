#' Create parameters for the \link{assoc_qt_covar} function
#' to be used in testing.
#'
#' Create parameters to detect associations with quantitative traits
#' and covariates  (using \link{assoc_qt_covar})
#' to be used in testing.
#' Use \link{create_assoc_qt_covar_params}) to create a custom
#' set of parameters.
#'
#' @note This function is named after the \code{--assoc}
#' and `--covar` `PLINK` flags, as well as forcing `PLINK`
#' to use quantitative trait phenotypic values.
#' @inheritParams default_params_doc
#' @examples
#' create_test_assoc_qt_covar_params()
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_assoc_qt_covar_params <- function( # nolint indeed a long function name
  maf = get_lowest_maf(),
  base_input_filename = file.path(
    get_plinkr_tempfilename(), "assoc_qt_covar_input"
  ),
  base_output_filename = file.path(
    get_plinkr_tempfilename(), "assoc_qt_covar_input"
  )
) {
  plinkr::check_maf(maf = maf)
  plinkr::check_base_input_filename(base_input_filename = base_input_filename)
  plinkr::check_base_output_filename(base_output_filename)
  plinkr::create_assoc_qt_covar_params(
    maf = maf,
    base_input_filename = base_input_filename,
    base_output_filename = base_output_filename
  )
}
