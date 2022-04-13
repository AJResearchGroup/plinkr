#' Create a random SNP selector to be used in testing
#'
#' Create a random SNP selector to be used in testing,
#' as can be used in, for example, \link{select_snps}
#' @inheritParams default_params_doc
#' @seealso Use \link{create_random_snp_selector} to
#' create a random SNP selector.
#'
#' There are multiple SNP selectors:
#'  * a single SNP: see \link{create_single_snp_selector}
#'  * one or more random SNPs: see \link{create_random_snp_selector}
#'  * a SNP range: see \link{create_snp_range_selector}
#'  * a window around a SNP: see \link{create_snp_window_selector}
#' @examples
#' create_test_random_snp_selector()
#' create_test_random_snp_selector(n_snps = 42)
#' @export
#' @author Richèl J.C. Bilderbeek
create_test_random_snp_selector <- function(
  n_snps = 2
) {
  plinkr::create_random_snp_selector(n_snps = n_snps)
}
