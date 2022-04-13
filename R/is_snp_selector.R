#' Determine if this is a SNP selector
#'
#' Determine if this is a SNP selector
#' @inheritParams default_params_doc
#' @return \link{TRUE} if this is a SNP selector
#' @examples
#' is_snp_selector(create_test_random_snp_selector())
#' is_snp_selector(create_test_single_snp_selector())
#' is_snp_selector(create_test_snp_range_selector())
#' is_snp_selector(create_test_snp_window_selector())
#'
#' is_snp_selector("nonsense")
#' @author Richèl J.C. Bilderbeek
#' @export
is_snp_selector <- function(
  snp_selector,
  verbose = FALSE
) {
  plinkr::check_verbose(verbose)
  result <- FALSE
  tryCatch({
    plinkr::check_snp_selector(snp_selector = snp_selector)
    result <- TRUE
  }, error = function(e) {
    if (verbose) message(e$message)
  }
  )
  result
}
