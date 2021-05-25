#' Check if the \code{maf} is valid.

#' Check if the \code{maf}, an abbreviation of 'Minor Allele
#' Frequency' is valid, which is when it is a number between
#' 0.0 and 0.5 (i.e. excluding 0.0 and 0.5).
#'
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if the input
#' is not number between
#' 0.0 and 0.5
#' @export
check_maf <- function(maf) {
  testthat::expect_true(is.numeric(maf))
  testthat::expect_equal(1, length(maf))
  testthat::expect_true(maf > 0.0)
  testthat::expect_true(maf < 0.5)
}
