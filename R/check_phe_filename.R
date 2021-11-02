#' Checks that the `phe_filename` is valid
#'
#' Checks that the `phe_filename` is valid.
#' Calls \link{stop} if not
#' @inheritParams default_params_doc
#' @return nothing
#' @examples
#' check_phe_filename("a.phe")
#' check_phe_filename("/folder/a.phe")
#' check_phe_filename("~/a.phe")
#' @author Richèl J.C. Bilderbeek
#' @export
check_phe_filename <- function(phe_filename) {
  if (length(phe_filename) != 1) {
    stop(
      "'phe_filename' must be one string. \n",
      "length(phe_filename): ", length(phe_filename)
    )
  }
  if (
    !stringr::str_detect(
      string = phe_filename,
      pattern = "^[[:graph:]]+\\.phe$"
    )
  ) {
    stop(
      "'phe_filename' must match regex '^[[:graph:]]+\\.phe$' \n",
      "phe_filename: ", phe_filename
    )
  }
}
