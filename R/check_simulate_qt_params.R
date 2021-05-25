#' Check if the input is a valid set of parameters to
#' simulate a quantitative trait, will stop otherwise
#'
#' This function is named after the \code{--simulate-qt} PLINK flag.
#' @inheritParams default_params_doc
#' @export
check_simulate_qt_params <- function(simulate_qt_params) {
  testthat::expect_true(is.list(simulate_qt_params))
  testthat::expect_true(
    "n_snps" %in% names(simulate_qt_params)
  )
  testthat::expect_true(
    "snp_label" %in% names(simulate_qt_params)
  )
  testthat::expect_true(
    "allele_frequency_lower" %in% names(simulate_qt_params)
  )
  testthat::expect_true(
    "allele_frequency_upper" %in% names(simulate_qt_params)
  )
  testthat::expect_true(
    "additive_genetic_variance" %in% names(simulate_qt_params)
  )
  testthat::expect_true(
    "ratio_dominance_to_additive" %in% names(simulate_qt_params)
  )
}
