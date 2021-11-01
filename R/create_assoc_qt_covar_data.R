#' Create data for the \link{assoc_qt_covar} function
#'
#' Create data to detect associations with quantitative traits
#' and covariates
#' (using \link{assoc_qt_covar}).
#' Use \link{create_test_assoc_qt_covar_data})
#' to create a dataset
#' that is used in testing.
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
create_assoc_qt_covar_data <- function(
  data,
  phenotype_data,
  cov_table
) {
  plinkr::check_data(data = data)
  plinkr::check_phenotype_data(phenotype_data = phenotype_data)
  plinkr::check_cov_table(cov_table = cov_table)
  list(
    data = data,
    phenotype_data = phenotype_data,
    cov_table = cov_table
  )
}
