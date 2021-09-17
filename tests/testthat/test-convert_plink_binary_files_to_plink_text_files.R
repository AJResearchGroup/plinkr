test_that("use", {
  skip("TODO: convert_plink_bin_files_to_plink_text_files")
  convert_plink_bin_files_to_plink_text_files(
    base_input_filename,
    base_output_filename = file.path(dirname(base_input_filename), "output"),
  )
  expect_silent(check_empty_plinkr_folder())
})
