test_that("use", {
  base_input_filename <- file.path(
    get_plinkr_tempfilename(),
    "save_plink_text_data"
  )
  filenames <- save_plink_text_data(
    plink_text_data = create_test_plink_text_data(),
    base_input_filename = base_input_filename
  )
  expect_equal(2, length(filenames))
  expect_equal(1, length(stringr::str_subset(filenames, "\\.map$")))
  expect_equal(1, length(stringr::str_subset(filenames, "\\.ped$")))
  file.remove(filenames)
  unlink(dirname(base_input_filename), recursive = TRUE)
  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})
