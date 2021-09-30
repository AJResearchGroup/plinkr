test_that("minimal use", {
  expect_silent(check_empty_plinkr_folder())

  bed_filename <- get_plinkr_tempfilename(fileext = ".bed")
  save_bed_table(
    bed_table = get_test_bed_table(),
    bed_filename = bed_filename
  )
  expect_true(file.exists(bed_filename))
  file.remove(bed_filename)

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache() # nolint
})

test_that("a .bed table has SNPs on the rows, and individuals on the columns", {
  expect_silent(check_empty_plinkr_folder())

  file_bed <- system.file("extdata", "sample.bed", package = "genio")
  file_bim <- system.file("extdata", "sample.bim", package = "genio")
  file_fam <- system.file("extdata", "sample.fam", package = "genio")
  # read annotation tables
  bim <- genio::read_bim(file_bim, verbose = FALSE)
  fam <- genio::read_fam(file_fam, verbose = FALSE)

  # read an existing Plink *.bim file
  # pass locus and individual IDs as vectors, setting data dimensions too
  bed_table <- genio::read_bed(file_bed, bim$id, fam$id, verbose = FALSE)

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache() # nolint
})

test_that("sub-sub-sub folder", {
  bed_table <- get_test_bed_table()
  bed_filename <- file.path(
    get_plinkr_tempfilename(),
    "sub", "sub", "sub", "folder", "test.bed"
  )
  save_bed_table(
    bed_table = bed_table,
    bed_filename = bed_filename
  )
  expect_true(file.exists(bed_filename))
  file.remove(bed_filename)
  unlink(
    dirname(dirname(dirname(dirname(dirname(bed_filename))))),
    recursive = TRUE
  )
})

test_that("write to impossible folder", {
  # Windows has no impossible folders
  if (get_os() == "win") return()

  bed_table <- get_test_bed_table()
  bed_filename <- "/root/test.bed"

  # Error by genio
  expect_error(
    save_bed_table(
      bed_table = bed_table,
      bed_filename = bed_filename
    ),
    "Could not open BED file `/root/test.bed` for writing: Permission denied"
  )
})

test_that("unsavable data?", {

  skip("Maybe noise")
  assoc_qt_params <- create_demo_assoc_qt_params()
  assoc_qt_params$data <- convert_plink_text_data_to_plink2_bin_data(
    assoc_qt_params$data
  )
  plink_bin_data <- plinkr::convert_plink2_bin_data_to_plink_bin_data(
    assoc_qt_params$data
  )
  testthat::expect_true(plinkr::is_plink_bin_data(plink_bin_data))
  base_input_filename <- get_plinkr_tempfilename()
  bin_filenames <- plinkr::save_plink_bin_data(
    plink_bin_data = plink_bin_data,
    base_input_filename = base_input_filename
  )
  plinkr::read_plink_bed_file_from_files(
    bed_filename = bin_filenames[1],
    bim_filename = bin_filenames[2],
    fam_filename = bin_filenames[3]
  )


  plinkr::read_plink_bin_files(
    base_input_filename = base_input_filename
  )

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache() # nolint
})
