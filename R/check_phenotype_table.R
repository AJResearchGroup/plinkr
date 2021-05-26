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

  n_phenotypes <- ncol(phenotype_table) - 2
  col_indices <- seq(from = 2 + 1, to = 2 + n_phenotypes)
  for (col_index in col_indices) {
    trait_values <- as.numeric(t(phenotype_table[, col_index]))
    if (all(trait_values %in% c(0, 1, 2))) {
      stop(
        "Phenotytic values match case-control values  \n",
        "in column '", names(phenotype_table)[col_index], "'. \n",
        "PLINK will always treat these valuse as case-control values\n",
        "and do a case-control analysis. \n",
        " \n",
        "If your values really need to be 1.0's and 2.0's, \n",
        "use a different unit (i.e. use 0.1 and 0.2 deci-unit) \n",
        "or add a little random noise, \n"
      )
    }
  }
}
