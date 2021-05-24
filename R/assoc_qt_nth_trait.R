#' Let PLINK detect an association with the n-th quantitative trait
#'
#' This function is named after the \code{--assoc} flag used by PLINK
#' @inheritParams default_params_doc
#' @export
assoc_qt_nth_trait <- function(
  assoc_qt_params,
  n
) {
  plinkr::check_assoc_qt_params(assoc_qt_params)
  testthat::expect_true(n >= 1)
  n_traits <- ncol(assoc_qt_params$phenotype_table) - 2
  if (n > n_traits) {
    stop(
      "Cannot associate the nth trait, as it is absent \n",
      "number of traits: ", n_traits, " \n",
      "n: ", n
    )
  }
  plinkr::assoc_qt(assoc_qt_params)
}
