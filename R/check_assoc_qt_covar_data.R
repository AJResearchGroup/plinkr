#' Check if the \code{assoc_qt_covar_data} are valid, will stop otherwise
#'
#' @note This function is named after the \code{--assoc} PLINK flag.
#' @inheritParams default_params_doc
#' @return Nothing.
#' @author Richèl J.C. Bilderbeek
#' @export
check_assoc_qt_covar_data <- function(assoc_qt_covar_data) {
  testthat::expect_true(is.list(assoc_qt_covar_data))
  testthat::expect_true("data" %in% names(assoc_qt_covar_data))
  testthat::expect_true("phenotype_data" %in% names(assoc_qt_covar_data))
  testthat::expect_true("cov_table" %in% names(assoc_qt_covar_data))
  testthat::expect_silent(
    plinkr::check_data(assoc_qt_covar_data$data)
  )
  testthat::expect_silent(
    plinkr::check_phenotype_data(assoc_qt_covar_data$phenotype_data)
  )
  testthat::expect_silent(
    plinkr::check_cov_table(assoc_qt_covar_data$cov_table)
  )
  plinkr::check_equal_number_of_snvs(assoc_qt_covar_data$data)
}
