#' Calculate the phenotypic values for a trait that is random and uniform.
#'
#' Calculate the phenotypic values for a trait that is random and uniform,
#' as produced by \link[stats]{runif}.
#' @inheritParams default_params_doc
#' @examples
#' t <- tibble::tibble(
#'   snv_1a = c("A", "A", "C", "C"),
#'   snv_1b = c("A", "C", "A", "C")
#' )
#' calc_runif_phenotype_values(t)
#' @author Richèl J.C. Bilderbeek
#' @export
calc_runif_phenotype_values <- function(snvs) {
  plinkr::check_snvs(snvs)
  testthat::expect_true(tibble::is_tibble(snvs))
  testthat::expect_true(all(as.matrix(snvs) %in% c("A", "C", "G", "T")))
  stats::runif(nrow(snvs))
}
