#' Check if the `assoc_qt_params` are valid, will stop otherwise
#'
#' @note This function is named after the \code{--assoc} PLINK flag.
#' @inheritParams default_params_doc
#' @return The `assoc_qt_params` with the class name added,
#' to indicate it has been checked
#' @author Richèl J.C. Bilderbeek
#' @export
check_assoc_qt_params <- function(assoc_qt_params, verbose = FALSE) {
  if (inherits(assoc_qt_params, "assoc_qt_params")) {
    if (verbose) {
      message("'assoc_qt_params' has been checked already")
    }
    return(assoc_qt_params)
  }

  testthat::expect_true(is.list(assoc_qt_params))
  testthat::expect_true("maf" %in% names(assoc_qt_params))
  testthat::expect_true("base_input_filename" %in% names(assoc_qt_params))
  testthat::expect_true("base_output_filename" %in% names(assoc_qt_params))
  testthat::expect_silent(plinkr::check_maf(assoc_qt_params$maf))
  testthat::expect_silent(
    plinkr::check_base_input_filename(assoc_qt_params$base_input_filename)
  )
  testthat::expect_silent(
    plinkr::check_base_output_filename(assoc_qt_params$base_output_filename)
  )

  if (verbose) {
    message("'assoc_qt_params' is valid, adding class name")
  }

  class(assoc_qt_params) <- "assoc_qt_params"

  assoc_qt_params
}
