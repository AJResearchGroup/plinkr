test_that("minimal use, toy_data", {
  bim <- read_plink_bim_file(get_plinkr_filename("toy_data.bim"))
  fam <- read_plink_fam_file(get_plinkr_filename("toy_data.fam"))
  expect_silent(
    read_plink_bed_file(get_plinkr_filename("toy_data.bed"), bim$id, fam$id)
  )
})

test_that("get test table, save, read", {
  clear_plinkr_cache()

  bed_filename <- get_plinkr_tempfilename(fileext = ".bed")
  bed_table <- get_test_bed_table()
  save_bed_table(
    bed_table = bed_table,
    bed_filename = bed_filename
  )
  expect_true(file.exists(bed_filename))
  read_plink_bed_file(bed_filename = ,
                      names_loci = ,
                      names_ind = )

  file.remove(bed_filename)

  expect_silent(check_empty_plinkr_folder())
})

test_that("create, read, save, read, PLINK v1.7", {
  if (!is_plink_installed(plink_options = create_plink_v1_7_options())) return()
  clear_plinkr_cache()

  # Create .bed file using PLINK v1.7
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
  fam_table <- read_plink_fam_file(plink_bin_filenames$fam_filename)
  bed_table <- read_plink_bed_file_from_files(
    bed_filename = plink_bin_filenames$bed_filename,
    bim_filename = plink_bin_filenames$bim_filename,
    fam_filename = plink_bin_filenames$fam_filename
  )

  # Save the table
  bed_filename_again <- get_plinkr_tempfilename(fileext = ".bed")
  save_bed_table(
    bed_table = bed_table,
    bed_filename = bed_filename_again
  )

  # Read the table again
  bed_table_again <- read_plink_bed_file_from_files(
    bed_filename = bed_filename_again,
    bim_filename = plink_bin_filenames$bim_filename,
    fam_filename = plink_bin_filenames$fam_filename
  )

  expect_identical(bed_table, bed_table_again)

  file.remove(bed_filename_again)
  unlink(folder_name, recursive = TRUE)

  expect_silent(check_empty_plinkr_folder())
})

test_that("create, read, save, read, PLINK v1.9", {
  if (!is_plink_installed(plink_options = create_plink_v1_9_options())) return()

  # Create .bed file using PLINK v1.9
  map_filename <- get_plinkr_filename("toy_v1_9.map")
  ped_filename <- get_plinkr_filename("toy_v1_9.ped")
  read_plink_map_file(map_filename)
  read_plink_ped_file(ped_filename)

  folder_name <- get_plinkr_tempfilename()
  plink_bin_filenames <- convert_plink_text_files_to_plink_bin_files(
    base_input_filename = tools::file_path_sans_ext(map_filename),
    base_output_filename = file.path(folder_name, "output"),
    plink_options = create_plink_v1_9_options()
  )

  # Read the table
  bim_table <- read_plink_bim_file(plink_bin_filenames$bim_filename)
  fam_table <- read_plink_fam_file(plink_bin_filenames$fam_filename)
  bed_table <- read_plink_bed_file_from_files(
    bed_filename = plink_bin_filenames$bed_filename,
    bim_filename = plink_bin_filenames$bim_filename,
    fam_filename = plink_bin_filenames$fam_filename
  )

  # Save the table
  bed_filename_again <- get_plinkr_tempfilename(fileext = ".bed")
  save_bed_table(
    bed_table = bed_table,
    bed_filename = bed_filename_again
  )

  # Read the table again
  bed_table_again <- read_plink_bed_file_from_files(
    bed_filename = bed_filename_again,
    bim_filename = plink_bin_filenames$bim_filename,
    fam_filename = plink_bin_filenames$fam_filename
  )

  expect_identical(bed_table, bed_table_again)

  file.remove(bed_filename_again)
  unlink(folder_name, recursive = TRUE)

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})

test_that("minimal use, demo_assoc.bed", {
  bim <- read_plink_bim_file(get_plinkr_filename("demo_assoc.bim"))
  fam <- read_plink_fam_file(get_plinkr_filename("demo_assoc.fam"))
  expect_silent(
    read_plink_bed_file(get_plinkr_filename("demo_assoc.bed"), bim$id, fam$id)
  )
})

test_that("minimal use, demo_assoc_qt", {
  bim <- read_plink_bim_file(get_plinkr_filename("demo_assoc_qt.bim"))
  fam <- read_plink_fam_file(get_plinkr_filename("demo_assoc_qt.fam"))
  expect_silent(
    read_plink_bed_file(get_plinkr_filename("demo_assoc_qt.bed"),
      bim$id,
      fam$id
    )
  )
})
