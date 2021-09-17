test_that("use", {
  expect_silent(check_empty_plinkr_folder())

  if (!is_plink_installed()) return()
  if (!is_plink_tutorial_data_installed()) return()

  # Work in a temporary folder
  plinkr_folder <- get_plinkr_tempfilename()

  # Convert to bfile
  tutorial_data_filenames <- get_plink_tutorial_data_filenames()
  hapmap1_map_filename <- stringr::str_subset(
    tutorial_data_filenames, "hapmap1.map"
  )
  phe_filename <- stringr::str_subset(
    tutorial_data_filenames, "pop.phe"
  )

  hapmap1_base_filename <- tools::file_path_sans_ext(hapmap1_map_filename)

  base_binary_filenames <- file.path(plinkr_folder, "hapmap1")
  base_assoc_filenames <- file.path(plinkr_folder, "assoc")

  binary_filenames <- make_bed(
    base_input_filename = hapmap1_base_filename,
    base_output_filename = base_binary_filenames
  )

  bfile <- base_binary_filenames
  out <- base_assoc_filenames
  assoc_results <- assoc_adjust_from_bfile(
    bfile = bfile,
    out = out
  )
  expect_true("assoc_table" %in% names(assoc_results))
  expect_true("log" %in% names(assoc_results))
  list.files(dirname(base_assoc_filenames), full.names = TRUE)
  unlink(plinkr_folder, recursive = TRUE)
  expect_silent(check_empty_plinkr_folder())
})
