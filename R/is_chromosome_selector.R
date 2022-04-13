#' Determine if this is a chromosome selector
#'
#' Determine if this is a chromosome selector
#' @inheritParams default_params_doc
#' @return \link{TRUE} if this is a chromosome selector
#' @examples
#' is_chromosome_selector(create_test_chromosome_selector())
#'
#' is_chromosome_selector("nonsense")
#' @author Richèl J.C. Bilderbeek
#' @export
is_chromosome_selector <- function(
  chromosome_selector,
  verbose = FALSE
) {
  plinkr::check_verbose(verbose)
  result <- FALSE
  tryCatch({
    plinkr::check_chromosome_selector(chromosome_selector = chromosome_selector)
    result <- TRUE
  }, error = function(e) {
    if (verbose) message(e$message)
  }
  )
  result
}
