#' Create testing parameters for the \link{assoc_qt} function
#'
#' Create parameters (as created by \link{create_assoc_qt_params})
#' to detect associations with quantitative traits
#' (using \link{assoc_qt}) used for testing.
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_assoc_qt_params <- function(
  maf = get_lowest_maf(),
  allow_no_sex = FALSE
) {
  plinkr::check_maf(maf = maf)
  plinkr::create_assoc_qt_params(
    maf = maf,
    allow_no_sex = allow_no_sex
  )
}
