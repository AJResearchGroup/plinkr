#' Check if the `confidence_interval` is valid.

#' Check if the `confidence_interval` is valid,
#' which is when it is a number between
#' 0.0 and 1.0 (i.e. excluding 0.0 and 1.0).
#'
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if the input
#' is not a number between
#' 0.0 and 1.0
#' @examples
#' check_confidence_interval(0.01)
#' check_confidence_interval(0.95)
#' check_confidence_interval(0.99)
#' @author Richèl J.C. Bilderbeek
#' @export
check_confidence_interval <- function(confidence_interval) {
  testthat::expect_true(is.numeric(confidence_interval))
  testthat::expect_equal(1, length(confidence_interval))
  testthat::expect_true(confidence_interval > 0.0)
  testthat::expect_true(confidence_interval < 1.0)
}
