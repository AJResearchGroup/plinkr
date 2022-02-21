#' Create a `sample_ids` to be used in testing
#'
#' Create a `sample_ids` to be used in testing
#' @return a `sample_ids`
#' @examples
#' check_sample_ids(get_test_sample_ids())
#' @author Richèl J.C. Bilderbeek
#' @export
get_test_sample_ids <- function() {
  plinkr::get_sample_ids_from_phe_table(get_test_phe_table())
}
