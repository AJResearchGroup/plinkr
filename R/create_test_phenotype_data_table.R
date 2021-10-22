#' Create a `phenotype_data_table` to be used in testing
#'
#' Create a `phenotype_data_table` to be used in testing
#' @inheritParams default_params_doc
#' @examples
#' create_test_phenotype_data_filename()
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_phenotype_data_table <- function(
  phe_table = plinkr::get_test_phe_table()
) {
  plinkr::create_phenotype_data_table(phe_table = phe_table)
}
