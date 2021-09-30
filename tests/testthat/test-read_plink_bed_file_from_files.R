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

test_that("minimal use, demo_assoc_qt", {
  expect_silent(
    read_plink_bed_file_from_files(
      bed_filename = "/home/richel/.cache/plinkr/file57fb49a63f1/assoc_input.bed",
      bim_filename = "/home/richel/.cache/plinkr/file57fb49a63f1/assoc_input.bim",
      fam_filename = "/home/richel/.cache/plinkr/file57fb49a63f1/assoc_input.fam"
    )
  )
})

