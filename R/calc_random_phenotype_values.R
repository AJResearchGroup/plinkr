#' Calculate the phenotypic values for a trait that is random.
#'
#' Calculate the phenotypic values for a trait that is random.
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
calc_random_phenotype_values <- function(snvs) {
  plinkr::check_snvs(snvs)
  testthat::expect_true(tibble::is_tibble(snvs))
  testthat::expect_equal(2, ncol(snvs))
  testthat::expect_true(all(as.matrix(snvs) %in% c("A", "C", "G", "T")))
  stats::runif(nrow(snvs))
}
