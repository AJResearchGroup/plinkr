test_that("use", {
  if (!is_plink_installed()) return()
  clear_plinkr_cache()
  base_input_filename <- tools::file_path_sans_ext(
    get_plinkr_filename("big_random.bed")
  )
  # Creates the 'pca' files in /inst/extdata, but locally
  base_output_filename <- file.path(
    get_plinkr_tempfilename(),
    "pca"
  )
  pca_result_filenames <- pca(
    base_input_filename = base_input_filename,
    base_output_filename = base_output_filename,
    plink_options = create_plink_v1_9_options(),
  )
  check_pca_result_filenames(pca_result_filenames)
  expect_true(
    length(list.files(dirname(base_output_filename)))
    > 0
  )
  unlink(dirname(base_output_filename), recursive = TRUE)
  check_empty_plinkr_folder()
})
