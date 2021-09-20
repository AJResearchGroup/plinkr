#' Save a \code{.fam} table to file.
#'
#' Save a \code{.fam} table to file
#' @inheritParams default_params_doc
#' @examples
#' fam_table <- get_test_fam_table()
#' fam_filename <- get_plinkr_tempfilename(fileext = ".fam")
#' save_fam_table_to_file(
#'   fam_table = fam_table,
#'   fam_filename = fam_filename
#' )
#' file.remove(fam_filename)
#' @author Richèl J.C. Bilderbeek
#' @export
save_fam_table_to_file <- function(
  fam_table,
  fam_filename,
  verbose = FALSE
) {
  plinkr::check_fam_table(fam_table)

  # genio will add .fam to the extension,
  # so let's enforce our users to add the extension
  if (tools::file_ext(fam_filename) != "fam") {
    stop(
      "'fam_filename' must have the '.fam' filename extension. \n",
      "fam_filename: ", fam_filename, " \n",
      "tools::file_ext(fam_filename): ", tools::file_ext(fam_filename), " \n"
    )
  }
  dir.create(dirname(fam_filename), showWarnings = FALSE, recursive = TRUE)
  genio::write_fam(
    file = normalizePath(fam_filename, mustWork = FALSE),
    tib = fam_table,
    verbose = verbose
  )
  testthat::expect_true(file.exists(fam_filename))
  invisible(fam_table)
}
