test_that("use", {
  clear_plinkr_cache()

  # 1. Convert existing PLINK bin files to temp PLINK text files,
  #    read text files (so they become tables)
  # 2. Read existing PLINK bin files,
  #    convert to text data (so they become tables)
  # 3. Both approaches must give the same results/tables
  expect_silent(check_empty_plinkr_folder())

  skip("TODO: convert_plink_bin_files_to_plink_text_files")
  # 1. Convert existing PLINK bin files to temp PLINK text files,
  #    read text files
  base_output_filename <- file.path(dirname(base_input_filename), "output")
  plink_bin_filenames <- convert_plink_bin_files_to_plink_text_files(
    base_input_filename = tools::file_path_sans_ext(
      get_plinkr_filename("test_v1_7_after_make-bed.bed")
    ),
    base_output_filename = base_output_filename
  )

  base_input_filename <-
  "test_v1_7_after_make-bed.bed"
  plink_bin_files <- read_plink_text_data(
    base_input_filename = base_input_filename,
  )

  plink_text_filenames <- convert_plink_bin_files_to_plink_text_files(
    base_input_filename = base_input_filename,
    base_output_filename = base_output_filename
  )
  expect_silent(check_empty_plinkr_folder())
})
