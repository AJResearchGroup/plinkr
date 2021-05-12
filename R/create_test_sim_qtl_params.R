#' Create a set of testing parameters for simulating
#' a quantitative trait
#' @inheritParams create_sim_qtl_params
#' @export
create_test_sim_qtl_params <- function(
  n_sns = 10,
  snp_label = "test_qtl",
  allele_frequency_lower = 0.05,
  allele_frequency_upper = 0.95,
  additive_genetic_variance = 0.01,
  ratio_dominance_to_additive = 0.0
) {
  plinkr::create_sim_qtl_params(
    n_sns = n_sns,
    snp_label = snp_label,
    allele_frequency_lower = allele_frequency_lower,
    allele_frequency_upper = allele_frequency_upper,
    additive_genetic_variance = additive_genetic_variance,
    ratio_dominance_to_additive = ratio_dominance_to_additive
  )
}
