#' Get the sample IDs from a `.fam` file
#'
#' Get the sample IDs from a `.fam` file
#' @inheritParams default_params_doc
#' @return the `sample_ids` (see \link{check_sample_ids})
#' @seealso use \link{get_sample_ids_from_fam_file} to extract
#' the `sample_ids` from a `.fam` file
#' @author Richèl J.C. Bilderbeek
#' @examples
#' fam_table <- get_test_fam_table()
#' get_sample_ids_from_fam_table(fam_table)
#' @export
get_sample_ids_from_fam_table <- function(fam_table) {
  plinkr::check_fam_table(fam_table)
  sample_ids <- fam_table[, c(1, 2)]
  plinkr::check_sample_ids(sample_ids)
  sample_ids
}
