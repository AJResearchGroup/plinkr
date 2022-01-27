#' Check if a family ID is valid
#'
#' Check if a family ID is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return nothing
#' @author Richèl J.C. Bilderbeek
#' @examples
#' check_fid("1")
#' check_fid("Doe")
#' @export
check_fid <- function(fid) {
  if (length(fid) != 1) {
    stop(
      "'fid' must have one element \n",
      "length(fid): ", length(fid)
    )
  }
  testthat::expect_equal(class(fid), "character")
  testthat::expect_true(nchar(fid) >= 1)
  invisible(fid)
}
