#' Check if the `PLINK` text data is valid.
#'
#' Check if the `PLINK` text data is valid.
#' Will \link{stop} if not.
#'
#' @inheritParams default_params_doc
#' @return nothing
#' @examples
#' plink_text_data <- create_plink_text_data(
#'   ped_table = get_test_ped_table(),
#'   map_table = get_test_map_table()
#' )
#' check_plink_text_data(plink_text_data)
#' @author Richèl J.C. Bilderbeek
#' @export
check_plink_text_data <- function(
  plink_text_data
) {
  if (!is.list(plink_text_data)) {
    stop(
      "'plink_text_data' must be a list  \n",
      "Actual class: ", class(plink_text_data), " \n",
      "Tip: use 'plinkr::create_plink_text_data()'\n"
    )
  }
  testthat::expect_true("ped_table" %in% names(plink_text_data))
  testthat::expect_true("map_table" %in% names(plink_text_data))
}
