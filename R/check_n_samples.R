#' Check if the number of samples is valid.

#' Check if the number of samples is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if the number of samples is invalid
#' @examples
#' check_n_samples(0)
#' check_n_samples(1)
#' check_n_samples(2)
#' @author Richèl J.C. Bilderbeek
#' @export
check_n_samples <- function(n_samples) {
  testthat::expect_equal(1, length(n_samples))
  testthat::expect_true(is.numeric(n_samples))
  testthat::expect_true(is.finite(n_samples))
  testthat::expect_true(n_samples >= 0)
  testthat::expect_equal(n_samples, as.integer(n_samples))
  invisible(n_samples)
}
