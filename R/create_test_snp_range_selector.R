#' Create a SNP range selector
#'
#' Create a SNP range selector,
#' to be used in, for example, \link{select_snps}
#' @inheritParams default_params_doc
#' @seealso Use \link{create_test_snp_range_selector} to
#' create a SNP window selector to be used in testing.
#'
#' There are multiple SNP selector checking functions,
#' see \link{check_snp_selector} for an overview
#' @examples
#' create_test_snp_range_selector()
#'
#' create_test_snp_range_selector(
#'   snp_from = "rs123456",
#'   snp_to = "rs234567"
#' )
#' @export
#' @author Richèl J.C. Bilderbeek
create_test_snp_range_selector <- function(
  snp_from = "rs123456",
  snp_to = "rs234567"
) {
  plinkr::create_snp_range_selector(
    snp_from = snp_from,
    snp_to = snp_to
  )
}
