#' Check if the \code{base_output_filename} is valid.

#' Check if the \code{base_output_filename},
#' which is a filename without an extension
#'
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if the output
#' is a filename
#' @author Richèl J.C. Bilderbeek
#' @export
check_base_output_filename <- function(base_output_filename) {
  testthat::expect_equal(1, length(base_output_filename))
  testthat::expect_true(is.character(base_output_filename))
  testthat::expect_true(nchar(base_output_filename) != 0)
}
