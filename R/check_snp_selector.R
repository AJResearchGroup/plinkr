#' Check if SNP selector is valid.
#'
#' Check if SNP selector is valid.
#' Will \link{stop} if not.
#'
#' Current SNP selectors are:
#'
#'  * A window, i.e. a focal SNP and the SNPs in range,
#'    see \link{create_snp_window_selector}
#'  * `[TODO]` One or more SNPs by name, see `create_snp_by_name_selector`
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
