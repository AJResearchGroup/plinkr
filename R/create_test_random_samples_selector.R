#' Create a random sample selector to be used in testing
#'
#' Create a random sample selector to be used in testing,
#' as can be used in, for example, \link{select_samples}
#' @inheritParams default_params_doc
#' @seealso Use \link{create_random_samples_selector} to
#' create a random sample selector.
#'
#' There are multiple sample selector checking functions,
#' see \link{create_samples_selector} for an overview
#' @examples
#' create_test_random_samples_selector()
#' create_test_random_samples_selector(n_samples = 42)
#'
#' check_random_samples_selector(create_test_random_samples_selector())
#' is_random_samples_selector(create_test_random_samples_selector())
#'
#' check_sample_selector(create_test_random_samples_selector())
#' is_sample_selector(create_test_random_samples_selector())
#' @export
#' @author Richèl J.C. Bilderbeek
create_test_random_samples_selector <- function( # nolint indeed a long function name
  n_samples = 2
) {
  plinkr::create_random_samples_selector(n_samples = n_samples)
}
