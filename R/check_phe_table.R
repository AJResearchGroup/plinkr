#' Check if a phenotype table is valid.
#'
#' Check if a phenotype table is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if the \code{phe_table} is invalid
#' @examples
#' check_phe_table(get_test_phe_table())
#' @author Richèl J.C. Bilderbeek
#' @export
check_phe_table <- function(phe_table) {
  testthat::expect_true(tibble::is_tibble(phe_table))
  testthat::expect_true(ncol(phe_table) >= 3)
  # PLINK names, from
  # https://www.cog-genomics.org/plink/1.9/input#pheno
  testthat::expect_equal("FID", names(phe_table)[1])
  testthat::expect_equal("IID", names(phe_table)[2])

  n_phenotypes <- ncol(phe_table) - 2
  col_indices <- seq(from = 2 + 1, to = 2 + n_phenotypes)
  for (col_index in col_indices) {
    trait_values <- as.numeric(t(phe_table[, col_index]))
    if (all(trait_values %in% c(0, 1, 2))) {
      stop(
        "Phenotypic values match case-control values  \n",
        "in column '", names(phe_table)[col_index], "'. \n",
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
