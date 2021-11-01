#' Create a dataset for the \link{assoc_qt} function to be used in testing.
#'
#' Create a dataset (as created by \link{create_assoc_qt_params})
#' to detect associations with quantitative traits
#' (using \link{assoc_qt}) used for testing.
#'
#' @note This function is named after the \code{--assoc} PLINK flag.
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_assoc_qt_covar_data <- function( # nolint indeed a long function name
  data = create_test_plink_text_data(),
  phenotype_data = plinkr::create_phenotype_data_table_from_data(
    data = data
  ),
  cov_table = plinkr::create_cov_table_from_ped_table(
    ped_table = phenotype_data$phe_table
  )
) {
  plinkr::check_data(data = data)
  plinkr::check_phenotype_data(phenotype_data = phenotype_data)
  plinkr::check_cov_table(cov_table = cov_table)
  plinkr::create_assoc_qt_covar_data(
    data = data,
    phenotype_data = phenotype_data,
    cov_table = cov_table
  )
}
