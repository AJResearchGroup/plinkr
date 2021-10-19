#' Create a `phenotype_data_table` to be used in testing
#'
#' Create a `phenotype_data_table` to be used in testing
#' @examples
#' create_test_phenotype_data_filename()
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_phenotype_data_table <- function() {
  list(
    phe_table = plinkr::read_plink_phe_file(
      plinkr::create_test_phenotype_data_filename()$phe_filename
    )
  )
}
