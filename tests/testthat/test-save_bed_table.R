test_that("minimal use", {
  clear_plinkr_cache()

  bed_filename <- get_plinkr_tempfilename(fileext = ".bed")
  bed_table <- get_test_bed_table(n_snps = 3)

  save_bed_table(
    bed_table = bed_table,
    bed_filename = bed_filename
  )
  expect_true(file.exists(bed_filename))

  bed_table_again <- read_plink_bed_file(
    bed_filename = bed_filename,
    names_loci = rownames(bed_table),
    names_ind = colnames(bed_table)
  )
  expect_identical(bed_table, bed_table_again)

  file.remove(bed_filename)

  expect_silent(check_empty_plinkr_folder())
})

test_that("must have .bed extension", {
  clear_plinkr_cache()

  expect_error(
    save_bed_table(
      bed_table = get_test_bed_table(),
      bed_filename = "irrelevant.not_bed"
    ),
    "must have the '.bed' filename extension"
  )

  expect_silent(check_empty_plinkr_folder())
})

test_that("a .bed table has SNPs on the rows, and individuals on the columns", {
  clear_plinkr_cache()

  file_bed <- system.file("extdata", "sample.bed", package = "genio")
  file_bim <- system.file("extdata", "sample.bim", package = "genio")
  file_fam <- system.file("extdata", "sample.fam", package = "genio")
  # read annotation tables
  bim <- genio::read_bim(file_bim, verbose = FALSE)
  fam <- genio::read_fam(file_fam, verbose = FALSE)

  # read an existing Plink *.bim file
  # pass locus and individual IDs as vectors, setting data dimensions too
  bed_table <- genio::read_bed(file_bed, bim$id, fam$id, verbose = FALSE)

  # Use attributes to distinguish between pgen and bed table
  attributes(bed_table)$plinkr_datatype <- "bed_table"

  expect_equal(get_n_snps(bed_table), 10)
  expect_silent(check_empty_plinkr_folder())
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
