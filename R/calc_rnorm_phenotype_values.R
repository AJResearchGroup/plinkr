#' Calculate the phenotypic values for a trait that is random and
#' follows a normal distribution.
#'
#' Calculate the phenotypic values for a trait that is random and
#' follows a normal distribution,
#' as produced by \link[stats]{rnorm}.
#' @inheritParams default_params_doc
#' @examples
#' t <- tibble::tibble(
#'   snv_1a = c("A", "A", "C", "C"),
#'   snv_1b = c("A", "C", "A", "C")
#' )
#' calc_rnorm_phenotype_values(t)
#' @author Richèl J.C. Bilderbeek
#' @export
calc_rnorm_phenotype_values <- function(snvs) {
  plinkr::check_snvs(snvs)
  testthat::expect_true(tibble::is_tibble(snvs))
  testthat::expect_true(all(as.matrix(snvs) %in% c("A", "C", "G", "T")))
  stats::rnorm(nrow(snvs))
}
