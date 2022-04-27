#' Check if sample selector is valid.
#'
#' Check if sample selector is valid.
#' Will \link{stop} if not.
#'
#' @inheritParams default_params_doc
#' @return Nothing.
#' @seealso
#' There are multiple sample selectors,
#' see \link{create_samples_selector} for an overview.
#'
#' There are multiple sample selector checking functions:
#'  * A single sample selector: \link{check_single_sample_selector}
#' @examples
#' check_sample_selector(create_test_single_sample_selector())
#' @author Richèl J.C. Bilderbeek
#' @export
check_sample_selector <- function(sample_selector) {
  tryCatch({
    plinkr::check_single_sample_selector(sample_selector)
    return(invisible(sample_selector))
  }, error = function(e) {} # nolint ignore
  )
  tryCatch({
    plinkr::check_random_samples_selector(sample_selector)
    return(invisible(sample_selector))
  }, error = function(e) {} # nolint ignore
  )
  stop("Unknown 'sample_selector'")
}
