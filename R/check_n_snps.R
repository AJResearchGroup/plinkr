#' Check if the number of SNPs is valid.

#' Check if the number of SNPs is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if the number of SNPs is invalid
#' @examples
#' check_n_snps(0)
#' check_n_snps(1)
#' check_n_snps(2)
#' @author Richèl J.C. Bilderbeek
#' @export
check_n_snps <- function(n_snps) {
  testthat::expect_equal(1, length(n_snps))
  testthat::expect_true(is.numeric(n_snps))
  testthat::expect_true(is.finite(n_snps))
  testthat::expect_true(n_snps >= 0)
  testthat::expect_equal(n_snps, as.integer(n_snps))
  invisible(n_snps)
}
