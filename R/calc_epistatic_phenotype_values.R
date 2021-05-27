#' Calculate the phenotypic values for a trait that is epistatic.
#'
#' Calculate the phenotypic values for a trait that is epistatic.
#'
#' A phenotypic value starts at 20.0.
#' Only four non-adenines results in a phenotype of 21.0
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
calc_epistatic_phenotype_values <- function(snvs) { # nolint indeed a long function name
  plinkr::check_snvs(snvs)
  testthat::expect_true(tibble::is_tibble(snvs))
  testthat::expect_equal(4, ncol(snvs))
  testthat::expect_true(all(as.matrix(snvs) %in% c("A", "C", "G", "T")))
  20 + (1.0 * (rowSums(snvs != "A") == 4))
}
