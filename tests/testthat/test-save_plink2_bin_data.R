test_that("can save", {
  base_input_filename <- file.path(
    get_plinkr_tempfilename(),
    "save_plink2_bin_data"
  )
  plink2_bin_filenames <- save_plink2_bin_data(
    plink2_bin_data = create_test_plink2_bin_data(),
    base_input_filename = base_input_filename
  )
  expect_silent(check_plink2_bin_filenames(plink2_bin_filenames))
  expect_true(file.exists(plink2_bin_filenames$pgen_filename))
  expect_true(file.exists(plink2_bin_filenames$psam_filename))
  expect_true(file.exists(plink2_bin_filenames$pvar_filename))
  unlink(dirname(base_input_filename), recursive = TRUE)
  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})
