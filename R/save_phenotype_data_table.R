#' Save a `phenotype_data` (in the form of a `phenotype_data_table`) to file
#'
#' Save a `phenotype_data` (in the form of a `phenotype_data_table`) to file,
#' returning a `phenotype_data` in the form of a `phenotype_data_filename`
#' @inheritParams default_params_doc
#' @return a `phenotype_data` in the form of a `phenotype_data_filename`
#' @author Richèl J.C. Bilderbeek
#' @export
save_phenotype_data_table <- function(
  phenotype_data_table,
  phe_filename
) {
  plinkr::check_phenotype_data_table(phenotype_data_table)
  plinkr::check_phe_filename(phe_filename)
  plinkr::save_phe_table(
    phe_table = phenotype_data_table$phe_table,
    phe_filename = phe_filename
  )
  plinkr::create_phenotype_data_filename(phe_filename = phe_filename)
}
