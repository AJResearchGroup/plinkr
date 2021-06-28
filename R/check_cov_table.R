#' Check if a covariate table is valid.
#'
#' Check if a covariate table is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if the \code{cov_table} is invalid
#' @author Richèl J.C. Bilderbeek
#' @export
check_cov_table <- function(cov_table) {
  testthat::expect_true(tibble::is_tibble(cov_table))
  testthat::expect_true(ncol(cov_table) >= 3)
  # PLINK names, from
  # https://www.cog-genomics.org/plink/1.9/input#pheno
  testthat::expect_equal("FID", names(cov_table)[1])
  testthat::expect_equal("IID", names(cov_table)[2])
}
