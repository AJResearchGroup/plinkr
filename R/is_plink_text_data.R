#' Determine if the `plink_text_data` is indeed `PLINK` text data
#'
#' Determine if the `plink_text_data` is indeed `PLINK` text data
#' @inheritParams default_params_doc
#' @return \link{TRUE} if the `plink_text_data` is indeed `PLINK` text data
#' @seealso `plinkr` has multiple functions to test if a type of data is valid:
#'
#'  * `PLINK` text data: use \link{is_plink_text_data}
#'  * `PLINK` binary data: use \link{is_plink_bin_data}
#'  * `PLINK2` binary data: use \link{is_plink2_bin_data}
#'
#' @examples
#' plink_text_data <- create_plink_text_data(
#'   ped_table = get_test_ped_table(),
#'   map_table = get_test_map_table()
#' )
#' is_plink_text_data(plink_text_data)
#' @author Richèl J.C. Bilderbeek
#' @export
is_plink_text_data <- function(
  plink_text_data
) {
  result <- FALSE
  tryCatch({
    plinkr::check_plink_text_data(plink_text_data = plink_text_data)
    result <- TRUE
  }, error = function(e) {} # nolint indeed ignore error
  )
  result
}
