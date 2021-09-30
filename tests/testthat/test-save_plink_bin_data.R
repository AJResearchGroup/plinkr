test_that("use", {
  skip("Cannot read freshly saved .bed file")
  base_input_filename <- file.path(
    get_plinkr_tempfilename(),
    "save_plink_bin_data"
  )
  filenames <- save_plink_bin_data(
    plink_bin_data = create_test_plink_bin_data(),
    base_input_filename = base_input_filename
  )
  expect_equal(3, length(filenames))
  expect_equal(1, length(stringr::str_subset(filenames, "\\.bed$")))
  expect_equal(1, length(stringr::str_subset(filenames, "\\.bim$")))
  expect_equal(1, length(stringr::str_subset(filenames, "\\.fam$")))
  file.remove(filenames)
  unlink(dirname(base_input_filename), recursive = TRUE)
  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})
