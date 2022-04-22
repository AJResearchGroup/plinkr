test_that("use, with test data", {
  clear_plinkr_cache()
  base_input_filename <- file.path(
    get_plinkr_tempfilename(),
    "save_plink_text_data"
  )
  plink_text_filenames <- save_plink_text_data(
    plink_text_data = create_test_plink_text_data(),
    base_input_filename = base_input_filename
  )
  expect_silent(check_plink_text_filenames(plink_text_filenames))

  file.remove(plink_text_filenames$map_filename)
  file.remove(plink_text_filenames$ped_filename)
  unlink(dirname(base_input_filename), recursive = TRUE)
  expect_silent(check_empty_plinkr_folder())
})

test_that("use, with ", {
  clear_plinkr_cache()

  base_input_filename <- file.path(
    get_plinkr_tempfilename(),
    "save_plink_text_with_demo_assoc_qt_data"
  )
  assoc_qt_data <- create_demo_assoc_qt_data()
  plink_text_filenames <- save_plink_text_data(
    plink_text_data = create_test_plink_text_data(),
    base_input_filename = base_input_filename
  )
  expect_silent(check_plink_text_filenames(plink_text_filenames))

  file.remove(plink_text_filenames$map_filename)
  file.remove(plink_text_filenames$ped_filename)
  unlink(dirname(base_input_filename), recursive = TRUE)
  expect_silent(check_empty_plinkr_folder())
})
