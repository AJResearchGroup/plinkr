#' Get the sample IDs from a `.phe` file
#'
#' Get the sample IDs from a `.phe` file
#' @inheritParams default_params_doc
#' @return the `sample_ids` (see \link{check_sample_ids})
#' @seealso use \link{get_sample_ids_from_phe_file} to extract
#' the `sample_ids` from a `.phe` file
#' @author Richèl J.C. Bilderbeek
#' @examples
#' phe_table <- get_test_phe_table()
#' get_sample_ids_from_phe_table(phe_table)
#' @export
get_sample_ids_from_phe_table <- function(phe_table) {
  plinkr::check_phe_table(phe_table)
  sample_ids <- phe_table[, c(1, 2)]
  plinkr::check_sample_ids(sample_ids)
  sample_ids
}
