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

test_that("ARTP2 issue, demo_assoc.bed", {
  skip("ARTP2 issue")
  bed_filename <- get_plinkr_filename("demo_assoc.bed")
  bim_filename <- get_plinkr_filename("demo_assoc.bim")
  fam_filename <- get_plinkr_filename("demo_assoc.fam")

  genio::read_bed(
    file = bed_filename,
    names_loci = plinkr::read_plink_bim_file(bim_filename)$id,
    names_ind = plinkr::read_plink_fam_file(fam_filename)$fam
  )

  t <- genio::read_fam(fam_filename)

  ARTP2::read.bed(
    bed = get_plinkr_filename("demo_assoc.bed"),
    bim = get_plinkr_filename("demo_assoc.bim"),
    fam = get_plinkr_filename("demo_assoc.fam")
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

test_that("genio bug report", {
  skip("bug report")
  # https://github.com/OchoaLab/genio/issues/3
  temp_folder <- tempfile()
  bed_filename <- file.path(temp_folder, "file.bed")
  bim_filename <- file.path(temp_folder, "file.bim")
  fam_filename <- file.path(temp_folder, "file.fam")
  dir.create(temp_folder, showWarnings = FALSE, recursive = TRUE)
  download.file(
    "https://github.com/kausmees/GenoCAE/blob/master/example_tiny/HumanOrigins249_tiny.bed?raw=true", # nolint indeed a long line
    destfile = bed_filename
  )
  download.file(
    "https://github.com/kausmees/GenoCAE/blob/master/example_tiny/HumanOrigins249_tiny.bim?raw=true", # nolint indeed a long line
    destfile = bim_filename
  )
  download.file(
    "https://github.com/kausmees/GenoCAE/blob/master/example_tiny/HumanOrigins249_tiny.fam?raw=true", # nolint indeed a long line
    destfile = fam_filename
  )
  # Works with ARTP2
  bed_table <- ARTP2::read.bed(
    bed = bed_filename,
    bim = bim_filename,
    fam = fam_filename
  )
  # Does not work with genio
  bim_table <- genio::read_bim(bim_filename)
  fam_table <- genio::read_bim(fam_filename)
  genio::read_bed(
    bed_filename,
    names_loci = bim_table$id,
    names_ind = fam_table$id
  )
})
