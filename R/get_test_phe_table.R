#' Create a phenotype table (`phe_table`) to be used in testing
#'
#' Create a phenotype table (`phe_table`) to be used in testing
#' @inheritParams default_params_doc
#' @return a phenotype table
#' @examples
#' check_phe_table(get_test_phe_table())
#' @author Richèl J.C. Bilderbeek
#' @export
get_test_phe_table <- function(
  phe_filename = plinkr::create_test_phenotype_data_filename()$phe_filename
) {
  plinkr::read_plink_phe_file(phe_filename = phe_filename)
}
