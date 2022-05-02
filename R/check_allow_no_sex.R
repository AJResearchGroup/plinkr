#' Check if the `allow_no_sex` is valid.

#' Check if the `allow_no_sex` is valid,
#' which is when it is either \link{TRUE} or \link{FALSE}.
#'
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if the input
#' is not either \link{TRUE} or \link{FALSE}.
#' @examples
#' check_allow_no_sex(allow_no_sex = TRUE)
#' check_allow_no_sex(allow_no_sex = FALSE)
#' @author Richèl J.C. Bilderbeek
#' @export
check_allow_no_sex <- function(allow_no_sex) {
  testthat::expect_equal(1, length(allow_no_sex))
  testthat::expect_true(is.logical(allow_no_sex))
  testthat::expect_false(is.na(allow_no_sex))
}
