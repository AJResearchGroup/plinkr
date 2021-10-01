test_that("minimal use", {
  expect_silent(
    create_plink_bin_filenames(
      bed_filename = "file.bed",
      bim_filename = "file.bim",
      fam_filename = "file.fam"
    )
  )
})
