#' Save a \code{.bed} table to file.
#'
#' Save a \code{.bed} table to file
#' @inheritParams default_params_doc
#' @examples
#' bed_table <- get_test_bed_table()
#' bed_filename <- get_plinkr_tempfilename(fileext = ".bed")
#' save_bed_table_to_file(
#'   bed_table = bed_table,
#'   bed_filename = bed_filename
#' )
#' file.remove(bed_filename)
#' @author Richèl J.C. Bilderbeek
#' @export
save_bed_table_to_file <- function(
  bed_table,
  bed_filename,
  verbose = FALSE
) {
  plinkr::check_bed_table(bed_table)

  # genio will add .bed to the extension,
  # so let's enforce our users to add the extension
  if (tools::file_ext(bed_filename) != "bed") {
    stop(
      "'bed_filename' must have the '.bed' filename extension. \n",
      "bed_filename: ", bed_filename, " \n",
      "tools::file_ext(bed_filename): ", tools::file_ext(bed_filename), " \n"
    )
  }
  dir.create(dirname(bed_filename), showWarnings = FALSE, recursive = TRUE)
  genio::write_bed(
    file = normalizePath(bed_filename, mustWork = FALSE),
    X = bed_table,
    verbose = verbose
  )
  testthat::expect_true(file.exists(bed_filename))
  invisible(bed_table)
}
