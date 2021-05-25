#' Check if a phenotype table is valid.
#'
#' Check if a phenotype table is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if the \code{phenotype_table} is invalid
#' @export
check_phenotype_table <- function(phenotype_table) {
  testthat::expect_true(tibble::is_tibble(phenotype_table))
  testthat::expect_true(ncol(phenotype_table) >= 3)
  testthat::expect_equal("family_id", names(phenotype_table)[1])
  testthat::expect_equal("within_family_id", names(phenotype_table)[2])
}
