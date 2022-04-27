#' Create a sample selector
#'
#' Create a sample selector.
#' This function is not meant to be used,
#' prefer the named specialized functions instead,
#' which are listed at the 'See Also' section.
#' @inheritParams default_params_doc
#' @return Nothing.
#' @seealso
#' There are multiple sample selectors,
#'  * A random samples selector: \link{create_random_samples_selector}
#'  * A single sample selector: \link{create_single_sample_selector}
#' @examples
#' create_samples_selector(create_test_random_samples_selector())
#' create_samples_selector(create_test_single_sample_selector())
#' @author Richèl J.C. Bilderbeek
#' @export
create_samples_selector <- function(sample_selector) {
  plinkr::check_sample_selector(sample_selector)
  sample_selector
}
