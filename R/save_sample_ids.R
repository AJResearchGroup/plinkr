#' Save a `sample_ids` to file.
#'
#' Save a `sample_ids` to file.
#' @inheritParams default_params_doc
#' @return Nothing. Will create a file
#' @examples
#' sample_ids <- get_test_sample_ids()
#' sample_ids_filename <- get_plinkr_tempfilename()
#' save_sample_ids(
#'   sample_ids = sample_ids,
#'   sample_ids_filename = sample_ids_filename
#' )
#'
#' # Clean up
#' file.remove(sample_ids_filename)
#' @author Richèl J.C. Bilderbeek
#' @export
save_sample_ids <- function(
  sample_ids,
  sample_ids_filename
) {
  plinkr::check_sample_ids(sample_ids)
  plinkr::check_sample_ids_filename(sample_ids_filename)

  dir.create(
    dirname(sample_ids_filename),
    recursive = TRUE,
    showWarnings = FALSE
  )

  readr::write_delim(sample_ids, sample_ids_filename)
  invisible(sample_ids)
}
