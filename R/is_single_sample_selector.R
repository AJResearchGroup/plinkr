#' Determine if this is a single sample selector
#'
#' Determine if this is a single sample selector
#' @inheritParams default_params_doc
#' @return \link{TRUE} if this is a single sample selector
#' @examples
#' is_single_sample_selector(create_test_single_sample_selector())
#'
#' is_single_sample_selector("nonsense")
#' @author Richèl J.C. Bilderbeek
#' @export
is_single_sample_selector <- function(
  single_sample_selector,
  verbose = FALSE
) {
  plinkr::check_verbose(verbose)
  result <- FALSE
  tryCatch({
    plinkr::check_single_sample_selector(
      single_sample_selector = single_sample_selector
    )
    result <- TRUE
  }, error = function(e) {
    if (verbose) message(e$message)
  }
  )
  result
}
