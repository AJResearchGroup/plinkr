#' Determine if this is a random sample selector
#'
#' Determine if this is a random sample selector
#' @inheritParams default_params_doc
#' @return \link{TRUE} if this is a random sample selector
#' @examples
#' is_random_samples_selector(create_test_random_samples_selector())
#'
#' is_random_samples_selector("nonsense")
#' @author Richèl J.C. Bilderbeek
#' @export
is_random_samples_selector <- function(
  random_samples_selector,
  verbose = FALSE
) {
  plinkr::check_verbose(verbose)
  result <- FALSE
  tryCatch({
    plinkr::check_random_samples_selector(
      random_samples_selector = random_samples_selector
    )
    result <- TRUE
  }, error = function(e) {
    if (verbose) message(e$message)
  }
  )
  result
}
