#' Check if a random-sample selector is valid.
#'
#' Check if a random-sample selector is valid.
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing.
#' @seealso
#' There are multiple sample selector checking functions,
#' see \link{create_sample_selector} for an overview
#' @examples
#' random_samples_selector(create_test_random_samples_selector())
#' @author Richèl J.C. Bilderbeek
#' @export
check_random_samples_selector <- function(random_samples_selector) {
  testthat::expect_true(is.list(random_samples_selector))
  testthat::expect_true("n_samples" %in% names(random_samples_selector))
  plinkr::check_n_samples(random_samples_selector$n_samples)
  invisible(random_samples_selector)
}
