#' Create a SNP range selector
#'
#' Create a SNP range selector,
#' to be used in, for example, \link{select_snps}
#' @inheritParams default_params_doc
#' @seealso Use \link{create_test_snp_range_selector} to
#' create a SNP window selector to be used in testing.
#'
#' There are multiple SNP selectors:
#'  * a single SNP: see \link{create_single_snp_selector}
#'  * a SNP range: see \link{create_snp_range_selector}
#'  * a window around a SNP: see \link{create_snp_window_selector}
#' @examples
#' create_snp_range_selector(
#'   snp_from = "rs123456",
#'   snp_to = "rs234567"
#' )
#' @export
#' @author Richèl J.C. Bilderbeek
create_snp_range_selector <- function(
  snp_from,
  snp_to
) {
  plinkr::check_snp(snp_from)
  plinkr::check_snp(snp_to)
  list(
    snp_from = snp_from,
    snp_to = snp_to
  )
}
