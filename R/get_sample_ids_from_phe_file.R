#' Get the sample IDs from a `.phe` file
#'
#' Get the sample IDs from a `.phe` file
#' @inheritParams default_params_doc
#' @return the `sample_ids` (see \link{check_sample_ids})
#' @seealso use \link{get_sample_ids_from_phe_table} to extract
#' the `sample_ids` from a `.phe` table that is already loaded in memory
#' @examples
#' phe_filename <- get_plinkr_filename("demo_assoc_qt.phe")
#' get_sample_ids_from_phe_file(phe_filename)
#' @author Richèl J.C. Bilderbeek
#' @export
get_sample_ids_from_phe_file <- function(phe_filename) {
  plinkr::check_phe_filename(phe_filename)
  phe_table <- plinkr::read_plink_phe_file(phe_filename)
  plinkr::get_sample_ids_from_phe_table(phe_table)
}
