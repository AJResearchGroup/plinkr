#' Calculate the phenotypic values for a case-control trait that is random.
#'
#' Calculate the phenotypic values for a case-control trait that is random.
#' @inheritParams default_params_doc
#' @examples
#' t <- tibble::tibble(
#'   snv_1a = c("A", "A", "C", "C"),
#'   snv_1b = c("A", "C", "A", "C")
#' )
#' calc_random_case_control_phenotype_values(t)
#' @author Richèl J.C. Bilderbeek
#' @export
calc_random_case_control_phenotype_values <- function(snvs) { # nolint indeed a long function name
  plinkr::check_snvs(snvs)
  testthat::expect_true(tibble::is_tibble(snvs))
  testthat::expect_true(all(as.matrix(snvs) %in% c("A", "C", "G", "T")))
  sample(c(1, 2), nrow(snvs), replace = TRUE)
}
