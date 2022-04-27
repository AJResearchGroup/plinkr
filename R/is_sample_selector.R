#' Determine if this is a sample selector
#'
#' Determine if this is a sample selector
#' @inheritParams default_params_doc
#' @return \link{TRUE} if this is a sample selector
#' @seealso use \link{is_snp_selector} to determine if a selector
#' is a SNP selector
#' @examples
#' is_sample_selector(create_test_random_samples_selector())
#' is_sample_selector(create_test_single_sample_selector())
#'
#' is_sample_selector("nonsense")
#' @author Richèl J.C. Bilderbeek
#' @export
is_sample_selector <- function(
  sample_selector,
  verbose = FALSE
) {
  plinkr::check_verbose(verbose)
  result <- FALSE
  tryCatch({
    plinkr::check_sample_selector(sample_selector = sample_selector)
    result <- TRUE
  }, error = function(e) {
    if (verbose) message(e$message)
  }
  )
  result
}
