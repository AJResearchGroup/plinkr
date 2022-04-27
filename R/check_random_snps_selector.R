#' Check if a random-SNP selector is valid.
#'
#' Check if a random-SNP selector is valid.
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing.
#' @seealso
#' There are multiple SNP selector checking functions,
#' see \link{create_snp_selector} for an overview
#' @examples
#' check_random_snps_selector(create_test_random_snps_selector())
#' @author Richèl J.C. Bilderbeek
#' @export
check_random_snps_selector <- function(random_snps_selector) {
  testthat::expect_true(is.list(random_snps_selector))
  testthat::expect_true("n_snps" %in% names(random_snps_selector))
  plinkr::check_n_snps(random_snps_selector$n_snps)
  invisible(random_snps_selector)
}
