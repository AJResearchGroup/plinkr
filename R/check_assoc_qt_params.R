#' Check if the \code{assoc_qt_params} are valid, will stop otherwise
#'
#' This function is named after the \code{--assoc-qt} PLINK flag.
#' @inheritParams default_params_doc
#' @return Nothing.
#' @export
check_assoc_qt_params <- function(assoc_qt_params) {
  testthat::expect_true(is.list(assoc_qt_params))
  testthat::expect_true("ped_table" %in% names(assoc_qt_params))
  testthat::expect_true("map_table" %in% names(assoc_qt_params))
  testthat::expect_true("phenotype_table" %in% names(assoc_qt_params))
  testthat::expect_true("maf" %in% names(assoc_qt_params))
  testthat::expect_true(assoc_qt_params$maf >= 0.0)
  testthat::expect_true(assoc_qt_params$maf < 0.5)
}
