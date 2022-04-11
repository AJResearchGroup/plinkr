#' Create a SNP window selector
#'
#' Create a SNP window selector,
#' to be used in, for example, \link{select_snps}
#' @inheritParams default_params_doc
#' @examples
#' create_snp_window_selector(
#'   snp = "my_snp",
#'   window_kb = 12.34
#' )
#' @export
#' @author Richèl J.C. Bilderbeek
create_snp_window_selector <- function(
  snp,
  window_kb
) {
  plinkr::check_snp(snp)
  plinkr::check_window_kb(window_kb)
  if (window_kb == 0.0) {
    stop(
      "'snp_window_selector' must select at least 1 base pair. \n",
      "Tip: set 'window_kb' to 0.001 to select 1 base pair"
    )
  }
  list(
    snp = snp,
    window_kb = window_kb
  )
}
