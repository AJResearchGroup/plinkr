#' Create a SNP selector to select a single SNP
#'
#' Create a SNP selector to select a single SNP,
#' to be used in, for example, \link{select_snps}
#' @inheritParams default_params_doc
#' @seealso Use \link{create_test_single_snp_selector} to
#' create a single-SNP selector to be used in testing.
#'
#' There are multiple SNP selectors:
#'  * a single SNP: see \link{create_single_snp_selector}
#'  * a SNP range: see \link{create_snp_range_selector}
#'  * a window around a SNP: see \link{create_snp_window_selector}
#' @examples
#' create_single_snp_selector(
#'   snp = "rs123456"
#' )
#' @export
#' @author Richèl J.C. Bilderbeek
create_single_snp_selector <- function(snp) {
  plinkr::check_snp(snp)
  list(snp = snp)
}
