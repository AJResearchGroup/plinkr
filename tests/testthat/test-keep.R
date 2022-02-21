test_that("use PLINK1", {
  if (!is_plink_installed()) return()

  clear_plinkr_cache()

  base_input_filename <- tools::file_path_sans_ext(
    get_plinkr_filename("test_v1_7_after_make-bed.bim")
  )
  base_output_filename <- get_plinkr_tempfilename(pattern = "keep_output")

  # Create sample IDs from phenotype file
  sample_ids_filename <- get_plinkr_tempfilename(pattern = "keep_sample_ids")
  sample_ids <- get_sample_ids_from_fam_file(
    paste0(base_input_filename, ".fam")
  )
  n_sample_ids_before <- nrow(sample_ids)
  plink_bin_data_before <- read_plink_bin_data(
    base_input_filename = base_input_filename
  )
  expect_equal(ncol(plink_bin_data_before$bed_table), n_sample_ids_before)
  expect_equal(nrow(plink_bin_data_before$fam_table), n_sample_ids_before)

  # Remove a sample
  sample_ids <- sample_ids[-1, ]
  n_sample_ids_after <- nrow(sample_ids)
  testthat::expect_true(n_sample_ids_after < n_sample_ids_before)
  save_sample_ids(
    sample_ids = sample_ids,
    sample_ids_filename = sample_ids_filename
  )

  # 'keep' check that the 'output_filenames' are created
  output_filenames <- keep(
    base_input_filename = base_input_filename,
    sample_ids_filename = sample_ids_filename,
    base_output_filename = base_output_filename
  )

  # Must have less individuals now
  plink_bin_data_after <- read_plink_bin_data(
    base_input_filename = base_output_filename
  )
  expect_equal(ncol(plink_bin_data_after$bed_table), n_sample_ids_after)
  expect_equal(nrow(plink_bin_data_after$fam_table), n_sample_ids_after)

  file.remove(sample_ids_filename)
  file.remove(as.character(unlist(output_filenames)))

  expect_silent(check_empty_plinkr_folder())
})
