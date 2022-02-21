#' Checks that the `sample_ids_filename` is valid
#'
#' Checks that the `sample_ids_filename` is valid.
#' Calls \link{stop} if not
#' @inheritParams default_params_doc
#' @return nothing
#' @examples
#' check_sample_ids_filename("sample_ids.txt")
#' check_sample_ids_filename("/folder/sample_ids.txt")
#' check_sample_ids_filename("~/sample_ids.txt")
#' @author Richèl J.C. Bilderbeek
#' @export
check_sample_ids_filename <- function(sample_ids_filename) {
  if (length(sample_ids_filename) != 1) {
    stop(
      "'sample_ids_filename' must be one string. \n",
      "length(sample_ids_filename): ", length(sample_ids_filename)
    )
  }
  testthat::expect_true(is.character(sample_ids_filename))
  testthat::expect_true(nchar(sample_ids_filename) > 0)
  testthat::expect_true(sample_ids_filename != ".")

}
