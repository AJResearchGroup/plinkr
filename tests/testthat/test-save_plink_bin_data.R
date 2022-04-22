test_that("can save", {
  clear_plinkr_cache()

  if (!is_plink_installed()) return()

  base_input_filename <- file.path(
    get_plinkr_tempfilename(),
    "save_plink_bin_data"
  )
  plink_bin_filenames <- save_plink_bin_data(
    plink_bin_data = create_test_plink_bin_data(),
    base_input_filename = base_input_filename
  )
  expect_silent(check_plink_bin_filenames(plink_bin_filenames))
  expect_silent(
    read_plink_bin_data(base_input_filename = base_input_filename)
  )

  file.remove(plink_bin_filenames$bed_filename)
  file.remove(plink_bin_filenames$bim_filename)
  file.remove(plink_bin_filenames$fam_filename)
  unlink(dirname(base_input_filename), recursive = TRUE)
  expect_silent(check_empty_plinkr_folder())
})
