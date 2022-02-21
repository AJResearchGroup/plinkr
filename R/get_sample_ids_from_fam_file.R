#' Get the sample IDs from a `fam` file
#'
#' Get the sample IDs from a `.fam` file
#' @inheritParams default_params_doc
#' @return the `sample_ids` (see \link{check_sample_ids})
#' @seealso use \link{get_sample_ids_from_fam_table} to extract
#' the `sample_ids` from a `.fam` table that is already loaded in memory
#' @examples
#' fam_filename <- get_plinkr_filename("demo_assoc.fam")
#' get_sample_ids_from_fam_file(fam_filename)
#' @author Richèl J.C. Bilderbeek
#' @export
get_sample_ids_from_fam_file <- function(fam_filename) {
  plinkr::check_fam_filename(fam_filename)
  fam_table <- plinkr::read_plink_fam_file(fam_filename)
  plinkr::get_sample_ids_from_fam_table(fam_table)
}
