#' Check if one or more within-family IDs are valid
#'
#' Check if one or more within-family IDs are valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return nothing
#' @author Richèl J.C. Bilderbeek
#' @examples
#' check_iids("1")
#' check_iids("Doe")
#' @export
check_iids <- function(iids) {
  testthat::expect_false(all(is.null(iids)))
  Vectorize(plinkr::check_iid)(iids)
}
