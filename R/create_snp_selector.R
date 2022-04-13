#' Create a SNP selector
#'
#' Create a SNP selector.
#' This function is not meant to be used,
#' prefer the named specialized functions instead,
#' which are listed at the 'See Also' section.
#' @inheritParams default_params_doc
#' @return Nothing.
#' @seealso
#' There are multiple SNP selectors,
#'  * A random SNP selector: \link{create_random_snp_selector}
#'  * A single SNP selector: \link{create_single_snp_selector}
#'  * A SNP range selector: \link{create_snp_range_selector}
#'  * A SNP window selector: \link{create_snp_window_selector}
#'
#' There are multiple SNP selector checking functions,
#' see \link{check_snp_selector} for an overview.
#' @examples
#' # Prefer using the specialized funtions over 'create_snp_selector'
#' create_snp_selector(create_test_random_snp_selector())
#' create_snp_selector(create_test_single_snp_selector())
#' create_snp_selector(create_test_snp_range_selector())
#' create_snp_selector(create_test_snp_window_selector())
#' @author Richèl J.C. Bilderbeek
#' @export
create_snp_selector <- function(snp_selector) {
  plinkr::check_snp_selector(snp_selector)
  snp_selector
}
