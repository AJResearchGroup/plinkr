#' Checks that the `fam_filename` is valid
#'
#' Checks that the `fam_filename` is valid.
#' Calls \link{stop} if not
#' @inheritParams default_params_doc
#' @return nothing
#' @examples
#' check_fam_filename("a.fam")
#' check_fam_filename("/folder/a.fam")
#' check_fam_filename("~/a.fam")
#' @author Richèl J.C. Bilderbeek
#' @export
check_fam_filename <- function(fam_filename) {
  if (length(fam_filename) != 1) {
    stop(
      "'fam_filename' must be one string. \n",
      "length(fam_filename): ", length(fam_filename)
    )
  }
  if (
    !stringr::str_detect(
      string = fam_filename,
      pattern = "^[[:graph:]]+\\.fam$"
    )
  ) {
    stop(
      "'fam_filename' must match regex '^[[:graph:]]+\\.fam$' \n",
      "fam_filename: ", fam_filename
    )
  }
}
