#' Check if the \code{ld_window_r2} is valid.

#' Check if the \code{ld_window_r2} is valid,
#' which is one number in range zero (including zero)
#' to one (including one)
#'
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if the input
#' is not one number in range zero
#' to one
#' @examples
#' check_ld_window_r2(0.0)
#' check_ld_window_r2(0.2)
#' check_ld_window_r2(1.0)
#' @author Richèl J.C. Bilderbeek
#' @export
check_ld_window_r2 <- function(ld_window_r2) {
  testthat::expect_equal(1, length(ld_window_r2))
  testthat::expect_true(is.numeric(ld_window_r2))
  testthat::expect_false(is.na(ld_window_r2))
  testthat::expect_true(ld_window_r2 >= 0.0)
}
