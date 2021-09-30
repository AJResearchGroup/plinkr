test_that("minimal use, test_v1_7_after_make-bed", {
  base_input_filename <- tools::file_path_sans_ext(
    get_plinkr_filename("test_v1_7_after_make-bed.bed")
  )
  plink_bin_data <- read_plink_bin_data(
    base_input_filename = base_input_filename
  )
  expect_silent(check_plink_bin_data(plink_bin_data))
  check_empty_plinkr_folder()
})
