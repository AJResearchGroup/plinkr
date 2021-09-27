#' Save a `.pvar` table to file.
#'
#' Save a `.pvar` table to file
#' @inheritParams default_params_doc
#' @examples
#' pvar_table <- get_test_pvar_table()
#' pvar_filename <- get_plinkr_tempfilename(fileext = ".pvar")
#' save_pvar_table_to_file(
#'   pvar_table = pvar_table,
#'   pvar_filename = pvar_filename
#' )
#' file.remove(pvar_filename)
#' @author Richèl J.C. Bilderbeek
#' @export
save_pvar_table_to_file <- function(
  pvar_table,
  pvar_filename,
  verbose = FALSE
) {
  plinkr::check_pvar_table(pvar_table)

  dir.create(dirname(pvar_filename), showWarnings = FALSE, recursive = TRUE)

  col_names <- colnames(pvar_table)
  col_names[1] <- paste0("#", col_names[1])
  colnames(pvar_table) <- col_names
  readr::write_tsv(
    x = pvar_table,
    file = pvar_filename,
    col_names = TRUE
  )
  testthat::expect_true(file.exists(pvar_filename))
  invisible(pvar_table)
}
