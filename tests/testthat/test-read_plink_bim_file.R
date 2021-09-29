test_that("minimal use", {
  expect_silent(
    read_plink_bim_file(get_plinkr_filename("toy_data.bim"))
  )
  expect_silent(
    read_plink_bim_file(get_plinkr_filename("demo_assoc.bim"))
  )
  expect_silent(
    read_plink_bim_file(get_plinkr_filename("demo_assoc_qt.bim"))
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
  bim_table <- read_plink_bim_file(plink_bin_filenames$bim_filename)

  # Save the table
  bim_filename_again <- get_plinkr_tempfilename(fileext = ".bim")
  save_bim_table(
    bim_table = bim_table,
    bim_filename = bim_filename_again
  )

  # Read the table again
  bim_table_again <- read_plink_bim_file(
    bim_filename = bim_filename_again
  )

  expect_identical(bim_table, bim_table_again)

  file.remove(bim_filename_again)
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
  bim_table <- read_plink_bim_file(plink_bin_filenames$bim_filename)

  # Save the table
  bim_filename_again <- get_plinkr_tempfilename(fileext = ".bim")
  save_bim_table(
    bim_table = bim_table,
    bim_filename = bim_filename_again
  )

  # Read the table again
  bim_table_again <- read_plink_bim_file(
    bim_filename = bim_filename_again
  )

  expect_identical(bim_table, bim_table_again)

  file.remove(bim_filename_again)
  unlink(folder_name, recursive = TRUE)

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})
