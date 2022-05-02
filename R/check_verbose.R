#' Check if the `verbose` is valid.

#' Check if the `verbose` is valid,
#' which is when it is either \link{TRUE} or \link{FALSE}.
#'
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if the input
#' is not either \link{TRUE} or \link{FALSE}.
#' @examples
#' check_verbose(verbose = TRUE)
#' check_verbose(verbose = FALSE)
#' @author Richèl J.C. Bilderbeek
#' @export
check_verbose <- function(verbose) {
  testthat::expect_equal(1, length(verbose))
  testthat::expect_true(is.logical(verbose))
  testthat::expect_false(is.na(verbose))
}
