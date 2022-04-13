#' Determine if this is a SNP window selector
#'
#' Determine if this is a SNP window selector
#' @inheritParams default_params_doc
#' @return \link{TRUE} if this is a SNP window selector
#' @examples
#' is_snp_window_selector(create_test_snp_window_selector())
#'
#' is_snp_window_selector("nonsense")
#' @author Richèl J.C. Bilderbeek
#' @export
is_snp_window_selector <- function(
  snp_window_selector,
  verbose = FALSE
) {
  plinkr::check_verbose(verbose)
  result <- FALSE
  tryCatch({
    plinkr::check_snp_window_selector(snp_window_selector = snp_window_selector)
    result <- TRUE
  }, error = function(e) {
    if (verbose) message(e$message)
  }
  )
  result
}
