test_that("minimal use, toy_data", {
  bim <- read_plink_bim_file(get_plinkr_filename("toy_data.bim"))
  fam <- read_plink_fam_file(get_plinkr_filename("toy_data.fam"))
  expect_silent(
    read_plink_bed_file(get_plinkr_filename("toy_data.bed"), bim$id, fam$id)
  )
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
