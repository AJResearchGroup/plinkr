#' Check if the \code{calc_phenotype_function} is valid.

#' Check if the \code{calc_phenotype_function}
#' is valid.
#'
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if the input
#' \code{calc_phenotype_function} is invalid
#' @author Richèl J.C. Bilderbeek
#' @export
check_calc_phenotype_function <- function(calc_phenotype_function) {
  testthat::expect_true(is.function(calc_phenotype_function))

  n_snps <- 1
  n_individuals <- 4
  snvs <- plinkr::create_snvs(n_snps = n_snps, n_individuals = n_individuals)
  phenotypes <- calc_phenotype_function(snvs)

  if (length(phenotypes) != nrow(snvs)) {
    stop(
      "'calc_phenotype_function' must return ",
        "as much phenotypes as there are individuals .\n",
      "n_phenotypes returned: ", length(phenotypes), " \n",
      "n_snps, aka ncol(snvs) * 2: ", n_snps , " \n",
      "n_individuals, aka nrow(snvs): ", length(phenotypes)
    )
  }

  n_snps <- 2
  n_individuals <- 16
  snvs <- plinkr::create_snvs(n_snps = n_snps, n_individuals = n_individuals)
  phenotypes <- calc_phenotype_function(snvs)

  if (length(phenotypes) != nrow(snvs)) {
    stop(
      "'calc_phenotype_function' must return ",
        "as much phenotypes as there are individuals .\n",
      "n_phenotypes returned: ", length(phenotypes), " \n",
      "n_snps, aka ncol(snvs) * 2: ", n_snps , " \n",
      "n_individuals, aka nrow(snvs): ", length(phenotypes)
    )
  }

}
