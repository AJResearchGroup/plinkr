#' Create a random samples selector
#'
#' Create a random samples selector
#' to be used in, for example, \link{select_samples}
#' @inheritParams default_params_doc
#' @seealso Use \link{create_test_random_samples_selector} to
#' create a random sample selector to be used in testing.
#'
#' There are multiple sample selectors,
#' see \link{create_sample_selector} for an overview
#' @examples
#' create_random_samples_selector(
#'   n_samples = 42
#' )
#' @export
#' @author Richèl J.C. Bilderbeek
create_random_samples_selector <- function(
  n_samples
) {
  plinkr::check_n_samples(n_samples)
  if (n_samples == 0) {
    stop(
      "'random_samples_selector' must select at least 1 sample. \n",
      "Tip: set 'n_samples' to 1 to select 1 sample"
    )
  }
  list(
    n_samples = n_samples
  )
}
