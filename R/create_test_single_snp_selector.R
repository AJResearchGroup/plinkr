#' Create a SNP selector to select a single SNP, to be used in testing
#'
#' Create a SNP selector to select a single SNP, to be used in testing.
#' A SNP selector is used in, for example, \link{select_snps}
#' @inheritParams default_params_doc
#' @seealso Use \link{create_single_snp_selector} to
#' create a regular single-SNP selector.
#'
#' There are multiple SNP selectors:
#'  * a single SNP: see \link{create_single_snp_selector}
#'  * a SNP range: see \link{create_snp_range_selector}
#'  * a window around a SNP: see \link{create_snp_window_selector}
#' @examples
#' create_test_single_snp_selector()
#'
#' create_test_single_snp_selector(
#'   snp = "rs123456"
#' )
#' @export
#' @author Richèl J.C. Bilderbeek
create_test_single_snp_selector <- function(snp = "rs123456") { # nolint indeed a long function name
  plinkr::create_single_snp_selector(snp = snp)
}
