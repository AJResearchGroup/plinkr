#' Check if one or more family IDs are valid
#'
#' Check if one or more family IDs are valid
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return nothing
#' @author Richèl J.C. Bilderbeek
#' @examples
#' check_fids("1")
#' check_fids("Doe")
#' @export
check_fids <- function(fids) {
  testthat::expect_false(all(is.null(fids)))
  Vectorize(plinkr::check_fid)(fids)
}
