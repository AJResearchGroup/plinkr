#' Check if a within-family ID is valid
#'
#' Check if a within-family ID is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return nothing
#' @author Richèl J.C. Bilderbeek
#' @examples
#' check_iid("1")
#' check_iid("Doe")
#' @export
check_iid <- function(iid) {
  if (length(iid) != 1) {
    stop(
      "'iid' must have one element \n",
      "length(iid): ", length(iid)
    )
  }
  testthat::expect_equal(class(iid), "character")
  testthat::expect_true(nchar(iid) >= 1)
  invisible(iid)
}
