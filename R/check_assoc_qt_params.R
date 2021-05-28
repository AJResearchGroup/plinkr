#' Check if the \code{assoc_qt_params} are valid, will stop otherwise
#'
#' @note This function is named after the \code{--assoc} PLINK flag.
#' @inheritParams default_params_doc
#' @return Nothing.
#' @author Richèl J.C. Bilderbeek
#' @export
check_assoc_qt_params <- function(assoc_qt_params) {
  testthat::expect_true(is.list(assoc_qt_params))
  testthat::expect_true("ped_table" %in% names(assoc_qt_params))
  testthat::expect_true("map_table" %in% names(assoc_qt_params))
  testthat::expect_true("phenotype_table" %in% names(assoc_qt_params))
  testthat::expect_true("maf" %in% names(assoc_qt_params))
  testthat::expect_silent(plinkr::check_ped_table(assoc_qt_params$ped_table))
  testthat::expect_silent(plinkr::check_map_table(assoc_qt_params$map_table))
  testthat::expect_silent(
    plinkr::check_phenotype_table(assoc_qt_params$phenotype_table)
  )
  testthat::expect_silent(plinkr::check_maf(assoc_qt_params$maf))
  plinkr::check_equal_number_of_snvs(assoc_qt_params)
}
