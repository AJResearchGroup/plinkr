test_that("use", {

  plink_bin_data <- read_plink_bin_data(
    base_input_filename = tools::file_path_sans_ext(
      get_plinkr_filename("test_v1_7_after_make-bed.bed")
    )
  )
  plink_text_data <- convert_plink_bin_data_to_plink_text_data(
    plink_bin_data = plink_bin_data
  )
  plink_text_data_again <- read_plink_text_data(
    base_input_filename = tools::file_path_sans_ext(
      get_plinkr_filename("test_v1_7.map")
    )
  )
  expect_identical(plink_text_data, plink_text_data_again)
})
