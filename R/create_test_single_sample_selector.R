#' Create a sample selector to select a single sample, to be used in testing
#'
#' Create a sample selector to select a single sample, to be used in testing.
#' A sample selector is used in, for example, \link{select_samples}
#' @inheritParams default_params_doc
#' @seealso Use \link{create_single_sample_selector} to
#' create a regular single-sample selector.
#'
#' There are multiple sample selectors,
#' see \link{create_samples_selector} for an overview
#' @examples
#' create_test_single_sample_selector()
#'
#' create_test_single_sample_selector(
#'   fid = "simpsons"
#' )
#' create_test_single_sample_selector(
#'   iid = "bart"
#' )
#' @export
#' @author Richèl J.C. Bilderbeek
create_test_single_sample_selector <- function( # nolint indeed a long function name
  fid = "adams",
  iid = "morticia"
) {
  plinkr::create_single_sample_selector(
    fid = fid,
    iid = iid
  )
}
