#' Create PLINK text data for testing
#'
#' Create PLINK text data for testing
#'
#' These is the same tables as can be obtained by reading
#' the PLINK v1.7 example files called
#' \code{test.ped} and \code{test.map}.
#' @inheritParams default_params_doc
#' @examples
#' data <- create_test_plink_text_data()
#' is_plink_text_data(data)
#' is_plink_bin_data(data)
#' is_plink2_bin_data(data)
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_plink_text_data <- function(
  ped_table = get_test_ped_table(),
  map_table = get_test_map_table()
) {
  plinkr::create_plink_text_data(
    ped_table = ped_table,
    map_table = map_table
  )
}
