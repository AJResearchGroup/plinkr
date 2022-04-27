#' Check if SNP windows selector is valid.
#'
#' Check if SNP windows selector is valid.
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing.
#' @seealso
#'
#' There are multiple SNP selector checking functions,
#' see \link{create_snps_selector} for an overview
#' @examples
#' check_snp_window_selector(create_test_snp_window_selector())
#' @author Richèl J.C. Bilderbeek
#' @export
check_snp_window_selector <- function(snp_window_selector) {
  testthat::expect_true(is.list(snp_window_selector))
  testthat::expect_true("snp" %in% names(snp_window_selector))
  testthat::expect_true("window_kb" %in% names(snp_window_selector))
  plinkr::check_snp(snp_window_selector$snp)
  plinkr::check_window_kb(snp_window_selector$window_kb)
  invisible(snp_window_selector)
}
