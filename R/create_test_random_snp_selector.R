#' Create a random SNP selector to be used in testing
#'
#' Create a random SNP selector to be used in testing,
#' as can be used in, for example, \link{select_snps}
#' @inheritParams default_params_doc
#' @seealso Use \link{create_random_snps_selector} to
#' create a random SNP selector.
#'
#' There are multiple SNP selector checking functions,
#' see \link{create_snp_selector} for an overview
#' @examples
#' create_test_random_snps_selector()
#' create_test_random_snps_selector(n_snps = 42)
#'
#' check_random_snps_selector(create_test_random_snps_selector())
#' is_random_snps_selector(create_test_random_snps_selector())
#'
#' check_snp_selector(create_test_random_snps_selector())
#' is_snp_selector(create_test_random_snps_selector())
#' @export
#' @author Richèl J.C. Bilderbeek
create_test_random_snps_selector <- function( # nolint indeed a long function name
  n_snps = 2
) {
  plinkr::create_random_snps_selector(n_snps = n_snps)
}
