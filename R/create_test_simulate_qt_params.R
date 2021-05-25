#' Create a set of testing parameters for simulating
#' a quantitative trait
#'
#' Create a set of parameters (see \link{create_simulate_qt_params})
#' for simulating a quantitative trait (see \link{simulate_qt})
#' to be used for testing.
#'
#' This function is named after the \code{--simulate-qt} PLINK flag.
#' @inheritParams create_simulate_qt_params
#' @export
create_test_simulate_qt_params <- function(
  n_snps = 10,
  snp_label = "test_trait",
  allele_frequency_lower = 0.05,
  allele_frequency_upper = 0.95,
  additive_genetic_variance = 0.01,
  ratio_dominance_to_additive = 0.0
) {
  plinkr::create_simulate_qt_params(
    n_snps = n_snps,
    snp_label = snp_label,
    allele_frequency_lower = allele_frequency_lower,
    allele_frequency_upper = allele_frequency_upper,
    additive_genetic_variance = additive_genetic_variance,
    ratio_dominance_to_additive = ratio_dominance_to_additive
  )
}
