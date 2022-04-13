#' Check if a single-SNP selector is valid.
#'
#' Check if a single-SNP selector is valid.
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing.
#' @seealso
#'
#' There are multiple SNP selector checking functions:
#'
#'  * general, any type: see \link{check_snp_selector}
#'  * a single SNP: see \link{check_single_snp_selector}
#'  * a SNP range: see \link{check_snp_range_selector}
#'  * a window around a SNP: see \link{check_snp_window_selector}
#' @examples
#' check_single_snp_selector(create_test_single_snp_selector())
#' @author Richèl J.C. Bilderbeek
#' @export
check_single_snp_selector <- function(single_snp_selector) {
  testthat::expect_true(is.list(single_snp_selector))
  testthat::expect_true("snp" %in% names(single_snp_selector))
  testthat::expect_false("window_kb" %in% names(single_snp_selector))
  plinkr::check_snp(single_snp_selector$snp)
  invisible(single_snp_selector)
}
