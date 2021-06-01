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

  snvs <- tibble::tibble(snv_1a = "A", snv_1b = "A")
  phenotypes <- calc_phenotype_function(snvs)

  if (length(phenotypes) != nrow(snvs)) {
    stop(
      "'calc_phenotype_function' must return ",
        "as much phenotypes as there are individuals .\n",
      "n_phenotypes returned: ", length(phenotypes), " \n",
      "n_individuals, aka nrow(snvs): ", length(phenotypes)
    )
  }
}
