test_that("minimal use", {
  expect_silent(
    create_convert_plink_bin_files_to_plink_text_files_args(
      base_input_filename = "base_input_filename",
      base_output_filename = "base_output_filename"
    )
  )
})
