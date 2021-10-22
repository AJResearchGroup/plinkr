#' Create a `phenotype_data_filename` to be used in testing
#'
#' Create a `phenotype_data_filename` to be used in testing
#' @inheritParams default_params_doc
#' @examples
#' create_test_phenotype_data_filename()
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_phenotype_data_filename <- function(
  phe_filename = get_plinkr_filename("pheno_with_standard_header.phe")
) {
  plinkr::create_phenotype_data_filename(
    phe_filename = phe_filename
  )
}
