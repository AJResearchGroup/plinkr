#' Check if a `assoc_qt_result` is valid.
#'
#' Check if a `assoc_qt_result` is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if the `assoc_qt_result` is invalid
#' @author Richèl J.C. Bilderbeek
#' @export
check_assoc_qt_result <- function(assoc_qt_result) {
  testthat::expect_true(is.list(assoc_qt_result))
  testthat::expect_true("qassoc_table" %in% names(assoc_qt_result))
  testthat::expect_true("log" %in% names(assoc_qt_result))
  plinkr::check_qassoc_table(assoc_qt_result$qassoc_table)
  invisible(assoc_qt_result)
}
