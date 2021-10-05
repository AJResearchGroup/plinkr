test_that("minimal use, test_v1_7", {
  base_input_filename <- tools::file_path_sans_ext(
    get_plinkr_filename("test_v1_7.ped")
  )
  plink_text_data <- read_plink_text_data(
    base_input_filename = base_input_filename
  )
  expect_silent(check_plink_text_data(plink_text_data))

  check_empty_plinkr_folder()
  clear_plinkr_cache()
})

