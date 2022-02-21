test_that("use PLINK1", {
  skip("WIP")
  base_input_filename <- tools::file_path_sans_ext(
    get_plinkr_filename("test_v1_7_after_make-bed.bim")
  )

  # Create sample IDs from phenotype file
  sample_ids_filename <- get_plinkr_tempfilename(pattern = "keep_sample_ids")
  sample_ids <- get_sample_ids_from_fam_file(
    paste0(base_input_filename, ".fam")
  )
  save_sample_ids(
    sample_ids = sample_ids,
    sample_ids_filename = sample_ids_filename
  )
  base_output_filename <- get_plinkr_tempfilename(pattern = "keep_output")

  keep(
    base_input_filename = base_input_filename,
    sample_ids_filename = sample_ids_filename,
    base_output_filename = base_output_filename
  )

  expect_silent(check_empty_plinkr_folder())
})

test_that("use PLINK2", {
  skip("WIP")
  psam_table <- get_test_psam_table()
  sample_ids <- psam_table[, 1:2]

  expect_silent(check_empty_plinkr_folder())
})
