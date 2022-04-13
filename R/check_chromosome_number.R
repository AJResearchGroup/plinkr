#' Check if the chromosome number is valid.

#' Check if the chromosome number is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if the chromosome number is invalid
#' @examples
#' check_chromosome_number(1)
#' check_chromosome_number(2)
#' @author Richèl J.C. Bilderbeek
#' @export
check_chromosome_number <- function(chromosome_number) {
  testthat::expect_equal(1, length(chromosome_number))
  testthat::expect_true(is.numeric(chromosome_number))
  testthat::expect_true(is.finite(chromosome_number))
  testthat::expect_true(chromosome_number >= 1)
  testthat::expect_equal(chromosome_number, as.integer(chromosome_number))
  invisible(chromosome_number)
}
