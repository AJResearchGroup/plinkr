#' Check if SNP selector is valid.
#'
#' Check if SNP selector is valid.
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing.
#' @examples
#' # A SNP window selector
#' check_snp_selector(create_test_snp_window_selector())
#'
#' # Other types of SNP selectors ...
#' @author Richèl J.C. Bilderbeek
#' @export
check_snp_selector <- function(snp_selector) {
  # TODO: check for other types of SNP selectors
  plinkr::check_snp_window_selector(snp_selector)
  invisible(snp_selector)
}
