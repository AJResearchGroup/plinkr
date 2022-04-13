#' Determine if this is a single SNP selector
#'
#' Determine if this is a single SNP selector
#' @inheritParams default_params_doc
#' @return \link{TRUE} if this is a single SNP selector
#' @examples
#' is_single_snp_selector(create_test_single_snp_selector())
#'
#' is_single_snp_selector("nonsense")
#' @author Richèl J.C. Bilderbeek
#' @export
is_single_snp_selector <- function(
  single_snp_selector,
  verbose = FALSE
) {
  plinkr::check_verbose(verbose)
  result <- FALSE
  tryCatch({
    plinkr::check_single_snp_selector(single_snp_selector = single_snp_selector)
    result <- TRUE
  }, error = function(e) {
    if (verbose) message(e$message)
  }
  )
  result
}
