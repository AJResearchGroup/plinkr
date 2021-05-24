#' Check if the input is a valid set of parameters to
#' simulate a quantitative trait, will stop otherwise
#' @inheritParams default_params_doc
#' @export
check_sim_qt_params <- function(sim_qt_params) {
  testthat::expect_true(is.list(sim_qt_params))
  testthat::expect_true("n_snps" %in% names(sim_qt_params))
  testthat::expect_true("snp_label" %in% names(sim_qt_params))
  testthat::expect_true("allele_frequency_lower" %in% names(sim_qt_params))
  testthat::expect_true("allele_frequency_upper" %in% names(sim_qt_params))
  testthat::expect_true("additive_genetic_variance" %in% names(sim_qt_params))
  testthat::expect_true("ratio_dominance_to_additive" %in% names(sim_qt_params))
}
