#' Determine if this is a SNP range selector
#'
#' Determine if this is a SNP range selector
#' @inheritParams default_params_doc
#' @return \link{TRUE} if this is a SNP range selector
#' @examples
#' is_snp_range_selector(create_test_snp_range_selector())
#'
#' is_snp_range_selector("nonsense")
#' @author Richèl J.C. Bilderbeek
#' @export
is_snp_range_selector <- function(
  snp_range_selector,
  verbose = FALSE
) {
  plinkr::check_verbose(verbose)
  result <- FALSE
  tryCatch({
    plinkr::check_snp_range_selector(snp_range_selector = snp_range_selector)
    result <- TRUE
  }, error = function(e) {
    if (verbose) message(e$message)
  }
  )
  result
}
