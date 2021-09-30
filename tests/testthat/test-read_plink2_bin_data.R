test_that("minimal use, test_v1_7_after_make-bed", {
  base_input_filename <- tools::file_path_sans_ext(
    get_plinkr_filename("test_v1_7_after_make-bed_after_make-pgen.pgen")
  )
  plink2_bin_data <- read_plink2_bin_data(
    base_input_filename = base_input_filename
  )
  expect_silent(check_plink2_bin_data(plink2_bin_data))
  check_empty_plinkr_folder()
})
