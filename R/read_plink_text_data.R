#' Read `PLINK` text files based on a shared base input filename
#'
#' Read `PLINK` text files based on a shared base input filename
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
read_plink_text_data <- function(
  base_input_filename,
  verbose = FALSE
) {
  ped_filename <- paste0(base_input_filename, ".ped")
  map_filename <- paste0(base_input_filename, ".map")
  testthat::expect_true(file.exists(ped_filename))
  testthat::expect_true(file.exists(map_filename))
  ped_table <- plinkr::read_plink_ped_file(ped_filename = ped_filename)
  map_table <- plinkr::read_plink_map_file(map_filename = map_filename)

  plinkr::create_plink_text_data(
    ped_table = ped_table,
    map_table = map_table
  )
}
