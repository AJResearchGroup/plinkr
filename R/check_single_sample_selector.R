#' Check if a single-sample selector is valid.
#'
#' Check if a single-sample selector is valid.
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return Nothing.
#' @seealso
#' There are multiple sample selector checking functions,
#' see \link{create_samples_selector} for an overview
#' @examples
#' check_single_sample_selector(create_test_single_sample_selector())
#' @author Richèl J.C. Bilderbeek
#' @export
check_single_sample_selector <- function(single_sample_selector) {
  testthat::expect_true(is.list(single_sample_selector))
  testthat::expect_true("fid" %in% names(single_sample_selector))
  testthat::expect_true("iid" %in% names(single_sample_selector))
  plinkr::check_fid(single_sample_selector$fid)
  plinkr::check_iid(single_sample_selector$iid)
  invisible(single_sample_selector)
}
