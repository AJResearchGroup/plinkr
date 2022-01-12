#' Determine if the `assoc_qt_data` is indeed data used for a
#' quantitative trait analysis (as done by \link{assoc_qt})
#'
#' Determine if the `assoc_qt_data` is indeed data used for a
#' quantitative trait analysis (as done by \link{assoc_qt})
#' @inheritParams default_params_doc
#' @return \link{TRUE} if the `assoc_qt_data` is indeed data used for a
#' quantitative trait analysis (as done by \link{assoc_qt})
#' @seealso `plinkr` has multiple functions to test if a type of data is valid:
#'
#'  * `PLINK` text data: use \link{is_plink_text_data}
#'  * `PLINK` binary data: use \link{is_plink_bin_data}
#'  * `PLINK2` binary data: use \link{is_plink2_bin_data}
#'  * any type of `PLINK`/`PLINK2` data: use \link{is_data}
#'  * associative trait analysis data: use \link{is_assoc_qt_data}
#'
#' @examples
#' assoc_qt_data <- create_test_assoc_qt_data()
#' is_assoc_qt_data(assoc_qt_data)
#' @author Richèl J.C. Bilderbeek
#' @export
is_assoc_qt_data <- function(
  assoc_qt_data
) {
  result <- FALSE
  tryCatch({
    plinkr::check_assoc_qt_data(assoc_qt_data = assoc_qt_data)
    result <- TRUE
  }, error = function(e) {} # nolint indeed ignore error
  )
  result
}
