#' Calculate the phenotypic values for a trait that is epistatic.
#'
#' Calculate the phenotypic values for a trait that is epistatic.
#'
#' A phenotypic value starts at 20.0.
#' Only genotypes without adenines results in a phenotype of 21.0
#' @inheritParams default_params_doc
#' @note  the reason a phenotypic value starts at 20.0, instead of 0.0,
#' is due to PLINK: if phenotypic values are all only zeroes and ones
#' (and twos), PLINK will interpret these as case-control codes.
#' There is no way to force PLINK to do a quantitative trait analysis on
#' zeroes and ones.
#'
#' As a workaround, epistatic traits start from twenty.
#' @author Richèl J.C. Bilderbeek
#' @export
calc_epistatic_phenotype_values <- function(
  snvs,
  regular_phenotype_value = 20.0,
  epistatic_phenotype_value = 21.0
) { # nolint indeed a long function name
  plinkr::check_snvs(snvs)
  testthat::expect_true(tibble::is_tibble(snvs))
  testthat::expect_true(all(as.matrix(snvs) %in% c("A", "C", "G", "T")))
  phenotype_values <- rep(regular_phenotype_value, nrow(snvs))
  is_epistatics <- rowSums(snvs != "A") == ncol(snvs)
  phenotype_values[is_epistatics] <- epistatic_phenotype_value
  phenotype_values
}
