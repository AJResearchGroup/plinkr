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
  confidence_interval = NA,
  allow_no_sex = FALSE
) {
  plinkr::check_maf(maf = maf)
  plinkr::check_confidence_interval(confidence_interval = confidence_interval)
  plinkr::check_allow_no_sex(allow_no_sex = allow_no_sex)
  plinkr::create_assoc_qt_params(
    maf = maf,
    confidence_interval = confidence_interval,
    allow_no_sex = allow_no_sex
  )
}
