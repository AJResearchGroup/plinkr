#' Calculate the phenotypic values for a trait that is perfectly additive.
#'
#' Calculate the phenotypic values for a trait that is perfectly additive.
#' A phenotypic value starts at \code{base_phenotype_value}.
#' An adenine does not change that value.
#' Another other nucleotide, however, increase that value
#' by \code{phenotype_increase}.
#' As the organism is diploid, the maximum phenotypic value is
#' \code{base_phenotype_value + (2 * phenotype_increase)}.
#' @inheritParams default_params_doc
#' @param base_phenotype_value the lowest phenotypic value possible
#' @param phenotype_increase the increase of the  phenotypic value
#' per non-adenine
#' @note  the reason a phenotypic value starts at 10.0, instead of 0.0,
#' is due to PLINK: if phenotypic values are all only zeroes and ones
#' (and twos), PLINK will interpret these as case-control codes.
#' There is no way to force PLINK to do a quantitative trait analysis on
#' zeroes and ones.
#'
#' As a workaround, phenotypic traits start from ten.
#' @author Richèl J.C. Bilderbeek
#' @export
calc_additive_phenotype_values <- function(
  snvs,
  base_phenotype_value = 10.0,
  phenotype_increase = 0.5
) {
  plinkr::check_snvs(snvs)
  testthat::expect_true(tibble::is_tibble(snvs))
  testthat::expect_true(all(as.matrix(snvs) %in% c("A", "C", "G", "T")))
  testthat::expect_true(is.numeric(base_phenotype_value))
  testthat::expect_true(is.numeric(phenotype_increase))
  base_phenotype_value + (phenotype_increase * rowSums(snvs != "A"))
}
