#' Create a set of testing parameters for simulating
#' a quantitative trait
#' @param n_snps Number of SNPs in this set
#' @param snp_label Label of this set of SNPs
#' @param allele_frequency_lower Lower allele frequency range
#' @param allele_frequency_upper Upper allele frequency range
#' @param additive_genetic_variance The additive genetic variance
#' @param ratio_dominance_to_additive The ratio of dominance to additive effects
#' @export
create_sim_qt_params <- function(
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
