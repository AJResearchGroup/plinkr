#' Calculate the phenotypic values for a trait that is perfectly additive.
#'
#' Calculate the phenotypic values for a trait that is perfectly additive.
#' A phenotypic value starts at 10.0.
#'
#'  * each `A` denotes an increase of 0.0
#'  * each `C` denotes an increase of 0.5
#'  * each `T` denotes an increase of 0.5
#'  * each `G` denotes an increase of 0.5
#'
#' The SNVs ('Single Nucleotide Variants') must reflect this genetic
#' architecture, i.e. must consist out of adenines and thymines
#' @inheritParams default_params_doc
#' @note  the reason a phenotypic value starts at 10.0, instead of 0.0,
#' is due to PLINK: if phenotypic values are all only zeroes and ones
#' (and twos), PLINK will interpret these as case-control codes.
#' There is no way to force PLINK to do a quantitative trait analysis on
#' zeroes and ones.
#'
#' As a workaround, phenotypic traits start from ten.
#' @author Richèl J.C. Bilderbeek
#' @export
calc_additive_phenotype_values <- function(snvs) {
  plinkr::check_snvs(snvs)
  testthat::expect_true(tibble::is_tibble(snvs))
  testthat::expect_equal(2, ncol(snvs))
  testthat::expect_true(all(as.matrix(snvs) %in% c("A", "C", "G", "T")))
  10 + (0.5 * rowSums(snvs != "A"))
}
