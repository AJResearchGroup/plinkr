#' Check if the `assoc_qt_params` are valid, will stop otherwise
#'
#' @note This function is named after the \code{--assoc} PLINK flag.
#' @inheritParams default_params_doc
#' @return The `assoc_qt_params` with the class name added,
#' to indicate it has been checked
#' @examples
#' check_assoc_qt_params(create_test_assoc_qt_params())
#' @author Richèl J.C. Bilderbeek
#' @export
check_assoc_qt_params <- function(assoc_qt_params, verbose = FALSE) {
  testthat::expect_true(is.list(assoc_qt_params))
  testthat::expect_true("maf" %in% names(assoc_qt_params))
  testthat::expect_true("allow_no_sex" %in% names(assoc_qt_params))
  testthat::expect_true("base_input_filename" %in% names(assoc_qt_params))
  testthat::expect_true("base_output_filename" %in% names(assoc_qt_params))
  plinkr::check_maf(assoc_qt_params$maf)
  plinkr::check_allow_no_sex(assoc_qt_params$allow_no_sex)
  plinkr::check_base_input_filename(assoc_qt_params$base_input_filename)
  plinkr::check_base_output_filename(assoc_qt_params$base_output_filename)
  assoc_qt_params
}
