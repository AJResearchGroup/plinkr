#' Check if the `PLINK` text data is valid.
#'
#' Check if the `PLINK` text data is valid.
#' Will \link{stop} if not.
#'
#' @inheritParams default_params_doc
#' @return nothing
#' @seealso `plinkr` has the following functions to check if in-memory `data`
#' is valid:
#'
#'  * `PLINK` text data: use \link{check_plink_text_data}
#'  * `PLINK` binary data: use \link{check_plink_bin_data}
#'  * `PLINK2` binary data: use \link{check_plink2_bin_data}
#'  * any of these: use \link{check_data}
#'
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
  plinkr::check_ped_table(plink_text_data$ped_table)
  plinkr::check_map_table(plink_text_data$map_table)
  plinkr::check_equal_number_of_snvs(plink_text_data)
}
