#' Create a SNP selector to select a single SNP
#'
#' Create a SNP selector to select a single SNP,
#' to be used in, for example, \link{select_snps}
#' @inheritParams default_params_doc
#' @seealso Use \link{create_test_single_snp_selector} to
#' create a single-SNP selector to be used in testing.
#'
#' There are multiple SNP selectors,
#' see \link{create_snp_selector} for an overview
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
