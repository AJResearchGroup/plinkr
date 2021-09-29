test_that("minimal use", {
  expect_silent(
    read_plink_fam_file(get_plinkr_filename("toy_data.fam"))
  )
  expect_silent(
    read_plink_fam_file(get_plinkr_filename("demo_assoc.fam"))
  )
  expect_silent(
    read_plink_fam_file(get_plinkr_filename("demo_assoc_qt.fam"))
  )
})

test_that("create, read, save, read, PLINK v1.7", {
  if (!is_plink_installed(plink_options = create_plink_v1_7_options())) return()

  # Create .bim file using PLINK v1.7
  map_filename <- get_plinkr_filename("test_v1_7.map")
  ped_filename <- get_plinkr_filename("test_v1_7.ped")
  folder_name <- get_plinkr_tempfilename()
  plink_bin_filenames <- convert_plink_text_files_to_plink_bin_files(
    base_input_filename = tools::file_path_sans_ext(map_filename),
    base_output_filename = file.path(folder_name, "output"),
    plink_options = create_plink_v1_7_options()
  )

  # Read the table
  fam_table <- read_plink_fam_file(plink_bin_filenames$fam_filename)

  # Save the table
  fam_filename_again <- get_plinkr_tempfilename(fileext = ".fam")
  save_fam_table(
    fam_table = fam_table,
    fam_filename = fam_filename_again
  )

  # Read the table again
  fam_table_again <- read_plink_fam_file(
    fam_filename = fam_filename_again
  )

  expect_identical(fam_table, fam_table_again)

  file.remove(fam_filename_again)
  unlink(folder_name, recursive = TRUE)

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})

test_that("create, read, save, read, PLINK v1.9", {
  if (!is_plink_installed(plink_options = create_plink_v1_9_options())) return()

  # Create .bed file using PLINK v1.9
  map_filename <- get_plinkr_filename("toy_v1_9.map")
  ped_filename <- get_plinkr_filename("toy_v1_9.ped")
  folder_name <- get_plinkr_tempfilename()
  plink_bin_filenames <- convert_plink_text_files_to_plink_bin_files(
    base_input_filename = tools::file_path_sans_ext(map_filename),
    base_output_filename = file.path(folder_name, "output"),
    plink_options = create_plink_v1_9_options()
  )

  # Read the table
  fam_table <- read_plink_fam_file(plink_bin_filenames$fam_filename)

  # Save the table
  fam_filename_again <- get_plinkr_tempfilename(fileext = ".fam")
  save_fam_table(
    fam_table = fam_table,
    fam_filename = fam_filename_again
  )

  # Read the table again
  fam_table_again <- read_plink_fam_file(
    fam_filename = fam_filename_again
  )

  expect_identical(fam_table, fam_table_again)

  file.remove(fam_filename_again)
  unlink(folder_name, recursive = TRUE)

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})
