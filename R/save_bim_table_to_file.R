#' Save a \code{.bim} table to file.
#'
#' Save a \code{.bim} table to file
#' @inheritParams default_params_doc
#' @examples
#' bim_table <- get_test_bim_table()
#' bim_filename <- get_plinkr_tempfilename(fileext = ".bim")
#' save_bim_table_to_file(
#'   bim_table = bim_table,
#'   bim_filename = bim_filename
#' )
#' file.remove(bim_filename)
#' @author Richèl J.C. Bilderbeek
#' @export
save_bim_table_to_file <- function(
  bim_table,
  bim_filename,
  verbose = FALSE
) {
  plinkr::check_bim_table(bim_table)

  # genio will add .bim to the extension,
  # so let's enforce our users to add the extension
  if (tools::file_ext(bim_filename) != "bim") {
    stop(
      "'bim_filename' must have the '.bim' filename extension. \n",
      "bim_filename: ", bim_filename, " \n",
      "tools::file_ext(bim_filename): ", tools::file_ext(bim_filename), " \n"
    )
  }
  dir.create(dirname(bim_filename), showWarnings = FALSE, recursive = TRUE)
  genio::write_bim(
    file = normalizePath(bim_filename, mustWork = FALSE),
    tib = bim_table,
    verbose = verbose,
    append = FALSE
  )
  testthat::expect_true(file.exists(bim_filename))
  invisible(bim_table)
}
