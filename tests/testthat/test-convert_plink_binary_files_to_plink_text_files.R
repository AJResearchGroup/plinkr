test_that("use", {
  clear_plinkr_cache()
  expect_silent(check_empty_plinkr_folder())

  skip("TODO: convert_plink_bin_files_to_plink_text_files")
  base_input_filename <- tools::file_path_sans_ext(
    get_plinkr_filename("test_v1_7_after_make-bed.bed")
  )
  convert_plink_bin_files_to_plink_text_files(
    base_input_filename,
    base_output_filename = file.path(dirname(base_input_filename), "output"),
  )
  expect_silent(check_empty_plinkr_folder())
})
