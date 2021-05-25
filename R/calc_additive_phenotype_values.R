#' Calculate the phenotypic values for a trait that is perfectly additive.
#'
#' Calculate the phenotypic values for a trait that is perfectly additive.
#'
#'  * each `A` denotes an increase of 0.0
#'  * each `T` denotes an increase of 0.5
#'
#' The SNVs ('Single Nucleotide Variants') must reflect this genetic
#' architecture, i.e. must consist out of adenines and thymines
#' @inheritParams default_params_doc
#' @export
calc_additive_phenotype_values <- function(snvs) {
  plinkr::check_snvs(snvs)
  testthat::expect_true(tibble::is_tibble(snvs))
  testthat::expect_equal(2, ncol(snvs))
  testthat::expect_true(all(as.matrix(snvs) %in% c("A", "T")))
  0.5 * rowSums(snvs == "T")
}
