#' Check if the `assoc_qt_data` is valid
#'
#' Check if the `assoc_qt_data` is valid.
#'
#' `assoc_qt_data` is a list combined of:
#'  * 'regular' data, as checked by \link{check_data}
#'  * phenotype data, as checked by \link{check_phenotype_data}
#'
#' Will \link{stop} if the `assoc_qt_data` is invalid
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
check_assoc_qt_data <- function(assoc_qt_data) {
  if (!is.list(assoc_qt_data)) {
    stop(
      "'assoc_qt_data' must be a list  \n",
      "Actual class: ", class(assoc_qt_data), " \n"
    )
  }
  testthat::expect_true("data" %in% names(assoc_qt_data))
  testthat::expect_true("phenotype_data" %in% names(assoc_qt_data))
  plinkr::check_data(assoc_qt_data$data)
  plinkr::check_phenotype_data(phenotype_data = assoc_qt_data$phenotype_data)
  invisible(assoc_qt_data)
}
