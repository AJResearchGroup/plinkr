#' Create a sample selector to select a single sample
#'
#' Create a sample selector to select a single sample,
#' to be used in, for example, \link{select_samples}
#' @inheritParams default_params_doc
#' @seealso Use \link{create_test_single_sample_selector} to
#' create a single-sample selector to be used in testing.
#'
#' There are multiple sample selectors,
#' see \link{create_sample_selector} for an overview
#' @examples
#' create_single_sample_selector(
#'   fid = "adams",
#'   iid = "3"
#' )
#' @export
#' @author Richèl J.C. Bilderbeek
create_single_sample_selector <- function(
  fid,
  iid
) {
  plinkr::check_fid(fid)
  plinkr::check_iid(iid)
  list(
    fid = fid,
    iid = iid
  )
}
