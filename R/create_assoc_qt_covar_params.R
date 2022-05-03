#' Create parameters for the \link{assoc_qt_covar} function
#'
#' Create parameters to detect associations with quantitative traits
#' and covariates  (using \link{assoc_qt_covar}).
#' Use \link{create_test_assoc_qt_covar_params}) to create a set of parameters
#' that is used in testing.
#'
#' @note This function is named after the \code{--assoc}
#' and `--covar` `PLINK` flags, as well as forcing `PLINK`
#' to use quantitative trait phenotypic values.
#' @inheritParams default_params_doc
#' @examples
#' check_assoc_qt_covar_params(create_assoc_qt_covar_params())
#' check_assoc_qt_covar_params(create_test_assoc_qt_covar_params())
#' @author Richèl J.C. Bilderbeek
#' @export
create_assoc_qt_covar_params <- function(
  maf = get_lowest_maf(),
  allow_no_sex = FALSE,
  base_input_filename = file.path(
    get_plinkr_tempfilename(), "assoc_qt_covar_input"
  ),
  base_output_filename = file.path(
    get_plinkr_tempfilename(), "assoc_qt_covar_input"
  )
) {
  plinkr::check_maf(maf = maf)
  plinkr::check_allow_no_sex(allow_no_sex)
  plinkr::check_base_input_filename(base_input_filename = base_input_filename)
  plinkr::check_base_output_filename(base_output_filename)
  list(
    maf = maf,
    allow_no_sex = allow_no_sex,
    base_input_filename = base_input_filename,
    base_output_filename = base_output_filename
  )
}
