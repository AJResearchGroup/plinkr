test_that("use", {
  skip("WIP")
  convert_plink_binary_files_to_plink_text_files(
    base_input_filename,
    base_output_filename = file.path(dirname(base_input_filename), "output"),
  )
  if (get_os() != "win") expect_silent(check_empty_plinkr_folder())
})
