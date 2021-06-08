#' Check if the \code{base_input_filename} is valid.

#' Check if the \code{base_input_filename},
#' which is a filename without an extension
#'
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if the input
#' is a filename
#' @author Richèl J.C. Bilderbeek
#' @export
check_base_input_filename <- function(base_input_filename) {
  testthat::expect_equal(1, length(base_input_filename))
  testthat::expect_true(is.character(base_input_filename))
  testthat::expect_true(nchar(base_input_filename) != 0)
}
