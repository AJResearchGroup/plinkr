test_that("use", {
  skip("'convert_plink_bin_data_to_ped_table' does not work yet")
  plink_bin_data <- read_plink_bin_data(
    base_input_filename = tools::file_path_sans_ext(
      get_plinkr_filename("test_v1_7_after_make-bed.bed")
    )
  )
  ped_table <- convert_plink_bin_data_to_ped_table(
    plink_bin_data = plink_bin_data
  )
  expect_silent(check_ped_table(ped_table))
  ped_table <- get_test_ped_table()
})
