#' Create a set of `PLINK` textual data
#' @inheritParams default_params_doc
#' @examples
#' create_plink_text_data(
#'   map_table = get_test_map_table(),
#'   ped_table = get_test_ped_table()
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
create_plink_text_data <- function(
  map_table,
  ped_table
) {
  map_table <- plinkr::check_map_table(map_table)
  ped_table <- plinkr::check_ped_table(ped_table)
  list(
    map_table = map_table,
    ped_table = ped_table
  )
}
