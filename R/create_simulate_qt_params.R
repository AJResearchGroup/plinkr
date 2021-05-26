#' Create a set of parameters for simulating
#' a quantitative trait
#'
#' Create a set of parameters for simulating
#' for simulating a quantitative trait (see \link{simulate_qt}).
#' Use \link{create_test_simulate_qt_params}) for a set of parameters
#' using in testing.
#'
#' @note This function is named after the \code{--simulate-qt} PLINK flag.
#' @inheritParams default_params_doc
#' @param snp_label Label of this set of SNPs
#' @param allele_frequency_lower Lower allele frequency range
#' @param allele_frequency_upper Upper allele frequency range
#' @param additive_genetic_variance The additive genetic variance
#' @param ratio_dominance_to_additive The ratio of dominance to additive effects
#' @author Richèl J.C. Bilderbeek
#' @export
create_simulate_qt_params <- function(
  n_snps,
  snp_label,
  allele_frequency_lower,
  allele_frequency_upper,
  additive_genetic_variance,
  ratio_dominance_to_additive
) {
  list(
    n_snps = n_snps,
    snp_label = snp_label,
    allele_frequency_lower = allele_frequency_lower,
    allele_frequency_upper = allele_frequency_upper,
    additive_genetic_variance = additive_genetic_variance,
    ratio_dominance_to_additive = ratio_dominance_to_additive
  )
}
