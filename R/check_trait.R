#' Check if a trait is valid.
#'
#' Check if a trait (with a clear genetic architecture and a known
#' minor allele frequency) is valid.
#' Will \link{stop} if not
#'
#' @inheritParams default_params_doc
#' @examples
#' check_trait(create_additive_trait())
#' check_trait(create_random_trait())
#' @export
#' @author Richèl J.C. Bilderbeek
check_trait <- function(trait) {
  testthat::expect_true(is.list(trait))
  testthat::expect_true("phenotype" %in% names(trait))
  testthat::expect_true("mafs" %in% names(trait))
  plinkr::check_phenotypes(trait$phenotype)
  plinkr::check_mafs(trait$mafs)
}
