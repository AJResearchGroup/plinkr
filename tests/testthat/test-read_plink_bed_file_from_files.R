test_that("minimal use, toy_data", {
  expect_silent(
    read_plink_bed_file_from_files(
      bed_filename = get_plinkr_filename("toy_data.bed"),
      bim_filename = get_plinkr_filename("toy_data.bim"),
      fam_filename = get_plinkr_filename("toy_data.fam")
    )
  )
})

test_that("minimal use, demo_assoc.bed", {
  expect_silent(
    read_plink_bed_file_from_files(
      bed_filename = get_plinkr_filename("demo_assoc.bed"),
      bim_filename = get_plinkr_filename("demo_assoc.bim"),
      fam_filename = get_plinkr_filename("demo_assoc.fam")
    )
  )
})

test_that("minimal use, demo_assoc_qt", {
  expect_silent(
    read_plink_bed_file_from_files(
      bed_filename = get_plinkr_filename("demo_assoc_qt.bed"),
      bim_filename = get_plinkr_filename("demo_assoc_qt.bim"),
      fam_filename = get_plinkr_filename("demo_assoc_qt.fam")
    )
  )
})

test_that("minimal use, select_snps.bed", {
  expect_silent(
    read_plink_bed_file_from_files(
      bed_filename = get_plinkr_filename("select_snps.bed"),
      bim_filename = get_plinkr_filename("select_snps.bim"),
      fam_filename = get_plinkr_filename("select_snps.fam")
    )
  )
})

test_that("minimal use, use example data from genio", {

  bed_filename <- get_plinkr_tempfilename(fileext = ".bed")
  bim_filename <- get_plinkr_tempfilename(fileext = ".bim")
  fam_filename <- get_plinkr_tempfilename(fileext = ".fam")
  dir.create(dirname(bed_filename), showWarnings = FALSE, recursive = TRUE)
  dir.create(dirname(bim_filename), showWarnings = FALSE, recursive = TRUE)
  dir.create(dirname(fam_filename), showWarnings = FALSE, recursive = TRUE)
  base_url <- "https://raw.githubusercontent.com/OchoaLab/genio/master/tests/testthat/" # nolint indeed a long line
  bed_url <- paste0(base_url, "dummy-4-10-0.1.bed")
  bim_url <- paste0(base_url, "dummy-4-10-0.1.bim")
  fam_url <- paste0(base_url, "dummy-4-10-0.1.fam")
  download.file(url = bed_url, destfile = bed_filename)
  download.file(url = bim_url, destfile = bim_filename)
  download.file(url = fam_url, destfile = fam_filename)
  bed_table <- read_plink_bed_file_from_files(
    bed_filename = bed_filename,
    bim_filename = bim_filename,
    fam_filename = fam_filename
  )
  bim_table <- read_plink_bim_file(bim_filename = bim_filename)
  fam_table <- read_plink_fam_file(fam_filename = fam_filename)
  expect_equal(
    10, get_n_snps_from_bed_table(bed_table = bed_table)
  )
  expect_equal(
    10, get_n_snps_from_bim_table(bim_table = bim_table)
  )
})
