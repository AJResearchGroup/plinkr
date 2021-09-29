#' Save a `.psam` table to file.
#'
#' Save a `.psam` table to file
#' @inheritParams default_params_doc
#' @examples
#' psam_table <- get_test_psam_table()
#' psam_filename <- get_plinkr_tempfilename(fileext = ".psam")
#' save_psam_table(
#'   psam_table = psam_table,
#'   psam_filename = psam_filename
#' )
#' file.remove(psam_filename)
#' @author Richèl J.C. Bilderbeek
#' @export
save_psam_table <- function(
  psam_table,
  psam_filename,
  verbose = FALSE
) {
  plinkr::check_psam_table(psam_table)

  dir.create(dirname(psam_filename), showWarnings = FALSE, recursive = TRUE)

  col_names <- colnames(psam_table)
  col_names[1] <- paste0("#", col_names[1])
  colnames(psam_table) <- col_names
  readr::write_tsv(
    x = psam_table,
    file = psam_filename,
    col_names = TRUE
  )
  testthat::expect_true(file.exists(psam_filename))
  invisible(psam_table)
}
