#' Create a `phenotype_data_filename`
#'
#' Create a `phenotype_data_filename`
#' @inheritParams default_params_doc
#' @seealso use \link{create_test_phenotype_data_filename}
#' to create a `phenotype_data_filename` to be used in testing
#' @examples
#' phe_filename <- get_plinkr_filename("pheno_with_standard_header.phe")
#' create_phenotype_data_filename(phe_filename)
#' @author Richèl J.C. Bilderbeek
#' @export
create_phenotype_data_filename <- function(phe_filename) {
  list(phe_filename = phe_filename)
}
