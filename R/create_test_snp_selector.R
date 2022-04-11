#' Create a SNP window selector
#'
#' Create a SNP window selector,
#' to be used in, for example, \link{select_snps}
#' @inheritParams default_params_doc
#' @examples
#' create_test_snp_window_selector()
#'
#' create_test_snp_window_selector(
#'   snp = "my_snp"
#' )
#'
#' create_test_snp_window_selector(
#'   window_kb = 12.34
#' )
#' @export
#' @author Richèl J.C. Bilderbeek
create_test_snp_window_selector <- function( # nolint indeed a long function name
  snp = "rs12345678",
  window_kb = 0.001
) {
  plinkr::create_snp_window_selector(
    snp = snp,
    window_kb = window_kb
  )
}
