#' Check if a SNP range selector is valid.
#'
#' Check if a SNP range selector is valid.
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing.
#' @seealso
#' There are multiple SNP selector checking functions,
#' see \link{create_snp_selector} for an overview
#' @examples
#' check_snp_range_selector(create_test_snp_range_selector())
#' @author Richèl J.C. Bilderbeek
#' @export
check_snp_range_selector <- function(snp_range_selector) {
  testthat::expect_true(is.list(snp_range_selector))
  testthat::expect_true("snp_from" %in% names(snp_range_selector))
  testthat::expect_true("snp_to" %in% names(snp_range_selector))
  plinkr::check_snp(snp_range_selector$snp_from)
  plinkr::check_snp(snp_range_selector$snp_to)
  invisible(snp_range_selector)
}
