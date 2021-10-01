test_that("use", {
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
  clear_plinkr_cache()
})
