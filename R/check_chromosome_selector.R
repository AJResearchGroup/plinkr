#' Check if a chromosome selector is valid.
#'
#' Check if a chromosome selector is valid.
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing.
#' @seealso
#' There are multiple SNP selector checking functions,
#' see \link{create_snps_selector} for an overview
#' @examples
#' check_chromosome_selector(create_test_chromosome_selector())
#' @author Richèl J.C. Bilderbeek
#' @export
check_chromosome_selector <- function(chromosome_selector) {
  testthat::expect_true(is.list(chromosome_selector))
  testthat::expect_true("chromosome_number" %in% names(chromosome_selector))
  plinkr::check_chromosome_number(chromosome_selector$chromosome_number)
  invisible(chromosome_selector)
}
