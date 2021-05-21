#' Let PLINK detect an association with a quantitative trait
#' @inheritParams default_params_doc
#' @export
assoc_qt <- function(
  ped_table,
  map_table,
  maf
) {
  testthat::expect_true(maf >= 0.0)
  testthat::expect_true(maf < 0.5)
  temp_folder <- tempfile()
  base_input_filename <- file.path(temp_folder, "assoc_qt_input")
  output_filename_base <- file.path(temp_folder, "assoc_qt_output")
  ped_filename <- paste0(base_input_filename, ".ped")
  map_filename <- paste0(base_input_filename, ".map")
  qassoc_filename <- paste0(output_filename_base, ".qassoc")

  plinkr::save_ped_table_to_file(
    ped_table = ped_table,
    ped_filename = ped_filename
  )
  testthat::expect_true(file.exists(ped_filename))
  plinkr::save_map_table_to_file(
    map_table = map_table,
    map_filename = map_filename
  )
  testthat::expect_true(file.exists(map_filename))

  # PLINK will ignore this
  dir.create(
    dirname(qassoc_filename),
    showWarnings = FALSE,
    recursive = TRUE
  )

  plinkr::run_plink(
    args = c(
      "--file", base_input_filename,
      "--assoc",
      "--maf", maf,
      "--out", output_filename_base
    )
  )
  plinkr::read_plink_qassoc_file(qassoc_filename)
}
