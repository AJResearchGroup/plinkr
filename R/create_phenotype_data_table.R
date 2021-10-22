#' Create a `phenotype_data_table`
#'
#' Create a `phenotype_data_table`.
#' @inheritParams default_params_doc
#' @seealso use \link{create_test_phenotype_data_table} to create a
#' `phenotype_data_table` to be used in testing
#' @examples
#' create_test_phenotype_data_filename()
#' @author Richèl J.C. Bilderbeek
#' @export
create_phenotype_data_table <- function(
  phe_table
) {
  plinkr::check_phe_table(phe_table)
  list(phe_table = phe_table)
}
