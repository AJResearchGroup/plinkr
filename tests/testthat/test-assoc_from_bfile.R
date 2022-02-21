test_that("use", {
  clear_plinkr_cache()

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

  assoc_results <- assoc_from_bfile(
    bfile = base_binary_filenames,
    out = base_assoc_filenames
  )
  expect_true("assoc_table" %in% names(assoc_results))
  expect_true("log" %in% names(assoc_results))
  list.files(dirname(base_assoc_filenames), full.names = TRUE)
  unlink(plinkr_folder, recursive = TRUE)
  expect_silent(check_empty_plinkr_folder())
})

test_that("minimal use with PLINK v1.7", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_plink_installed(plink_options = create_plink_v1_7_options())) return()

  clear_plinkr_cache()

  bfile <- tools::file_path_sans_ext(
    get_plinkr_filename("toy_v1_9_after_make-bed.bed")
  )
  out <- file.path(get_plinkr_tempfilename(), "assoc_from_bfile")
  assoc_results <- assoc_from_bfile(
    bfile = bfile,
    out = out,
    plink_options = create_plink_v1_7_options()
  )
  unlink(dirname(out), recursive = TRUE)

  expect_silent(check_empty_plinkr_folder())
})
