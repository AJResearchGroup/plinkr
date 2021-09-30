#' Check if the \code{assoc_qt_covar_params} are valid, will stop otherwise
#'
#' @note This function is named after the \code{--assoc} PLINK flag.
#' @inheritParams default_params_doc
#' @return Nothing.
#' @author Richèl J.C. Bilderbeek
#' @export
check_assoc_qt_covar_params <- function(assoc_qt_covar_params) {
  testthat::expect_true(is.list(assoc_qt_covar_params))
  testthat::expect_true("data" %in% names(assoc_qt_covar_params))
  testthat::expect_true("phe_table" %in% names(assoc_qt_covar_params))
  testthat::expect_true("cov_table" %in% names(assoc_qt_covar_params))
  testthat::expect_true("maf" %in% names(assoc_qt_covar_params))
  testthat::expect_true(
    "base_input_filename" %in% names(assoc_qt_covar_params)
  )
  testthat::expect_true(
    "base_output_filename" %in% names(assoc_qt_covar_params)
  )
  testthat::expect_silent(
    plinkr::check_data(assoc_qt_covar_params$data)
  )
  testthat::expect_silent(
    plinkr::check_phe_table(assoc_qt_covar_params$phe_table)
  )
  testthat::expect_silent(
    plinkr::check_cov_table(assoc_qt_covar_params$cov_table)
  )
  testthat::expect_silent(plinkr::check_maf(assoc_qt_covar_params$maf))
  testthat::expect_silent(
    plinkr::check_base_input_filename(assoc_qt_covar_params$base_input_filename)
  )
  testthat::expect_silent(
    plinkr::check_base_output_filename(
      assoc_qt_covar_params$base_output_filename
    )
  )
  plinkr::check_equal_number_of_snvs(assoc_qt_covar_params$data)
}
