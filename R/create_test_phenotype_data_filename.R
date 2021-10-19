#' Create a `phenotype_data_filename` to be used in testing
#'
#' Create a `phenotype_data_filename` to be used in testing
#' @examples
#' create_test_phenotype_data_filename()
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_phenotype_data_filename <- function() {
  list(phe_filename = get_plinkr_filename("pheno_with_standard_header.phe"))
}
