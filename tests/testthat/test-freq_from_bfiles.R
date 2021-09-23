test_that("use", {
  skip("Error: embedded nul in string")
  if (!is_plink_installed()) return()
  if (!is_plink_tutorial_data_installed()) return()

  # Work in a temporary folder
  plinkr_folder <- get_plinkr_tempfilename()

  # Convert to bfile
  tutorial_data_filenames <- get_plink_tutorial_data_filenames()
  hapmap1_map_filename <- stringr::str_subset(
    tutorial_data_filenames, "hapmap1.map"
  )
  hapmap1_base_filename <- tools::file_path_sans_ext(hapmap1_map_filename)

  base_binary_filenames <- file.path(plinkr_folder, "hapmap1")
  base_miss_stat_filenames <- file.path(plinkr_folder, "miss_stat")

  binary_filenames <- make_bed(
    base_input_filename = hapmap1_base_filename,
    base_output_filename = base_binary_filenames
  )

  if (1 == 2) {
    bed_table <- plinkr::read_plink_bed_file_from_files(
      bed_filename = stringr::str_subset(binary_filenames, "\\.bed$"),
      bim_filename = stringr::str_subset(binary_filenames, "\\.bim$"),
      fam_filename = stringr::str_subset(binary_filenames, "\\.fam$")
    )
    bed_table[1:5, 1:10]
  }

  freq_result <- freq_from_bfile(
    bfile = base_binary_filenames,
    out = base_miss_stat_filenames
  )

  list.files(dirname(base_miss_stat_filenames), full.names = TRUE)
  unlink(plinkr_folder, recursive = TRUE)

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})
