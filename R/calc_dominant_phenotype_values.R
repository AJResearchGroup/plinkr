#' Calculate the phenotypic values for a trait that is dominant.
#'
#' Calculate the phenotypic values for a trait that is dominant.
#' It is assumed that adenine is the dominant genotype,
#' and the other nucleotides are recessive.
#' Per SNP, if there is at least one adenine,
#' the phenotypic value is \code{phenotype_value_dominant}.
#' else the phenotypic value is \code{phenotype_value_recessive}.
#'
#' If there are more SNPs, the phenotypic values are averaged.
#' @inheritParams default_params_doc
#' @param base_phenotype_value the lowest phenotypic value possible
#' @param phenotype_increase the increase of the  phenotypic value
#' per non-adenine
#' @note  the reason a these phenotypic value are 10.0 and 11.0,
#' instead of -say- 0.0 and 1.0,
#' is due to PLINK: if phenotypic values are all only zeroes and ones
#' (and twos), PLINK will interpret these as case-control codes.
#' There is no way to force PLINK to do a quantitative trait analysis on
#' zeroes and ones.
#'
#' As a workaround, phenotypic values start from ten.
#' @author Richèl J.C. Bilderbeek
#' @export
calc_dominant_phenotype_values <- function(
  snvs,
  phenotype_value_recessive = 10.0,
  phenotype_value_dominant = 11.0
) {
  plinkr::check_snvs(snvs)
  testthat::expect_true(tibble::is_tibble(snvs))
  testthat::expect_true(all(as.matrix(snvs) %in% c("A", "C", "G", "T")))
  testthat::expect_true(is.numeric(phenotype_value_recessive))
  testthat::expect_true(is.numeric(phenotype_value_dominant))
  # Couldn't get it to work with dplyr, hence by hand :-/
  f_recessive <- rep(NA, nrow(snvs))
  for (i in seq_along(f_recessive)) {
    is_recessive <- as.logical(snvs[i, ] != "A")
    seq_lhs <- seq(1, length(is_recessive), by = 2)
    seq_rhs <- seq(2, length(is_recessive), by = 2)
    both_recessive <- is_recessive[seq_lhs] & is_recessive[seq_rhs]
    n_recessive <- sum(both_recessive)
    f_recessive[i] <- n_recessive / (length(is_recessive) / 2)
  }
  (f_recessive * phenotype_value_recessive) +
  ( (1.0 - f_recessive) * phenotype_value_dominant)
}
