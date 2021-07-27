#' Determine if the `plink_text_data` is indeed `PLINK` text data
#' @inheritParams default_params_doc
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
