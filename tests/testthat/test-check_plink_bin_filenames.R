test_that("use", {
  plink_bin_filenames <- create_plink_bin_filenames(
    bed_filename = "file.bed",
    bim_filename = "file.bim",
    fam_filename = "file.fam"
  )
  expect_silent(check_plink_bin_filenames(plink_bin_filenames))
  expect_error(check_plink_bin_filenames("nonsense"))
  expect_error(check_plink_bin_filenames(NULL))
  expect_error(check_plink_bin_filenames(NA))
  expect_error(check_plink_bin_filenames(42))
  expect_error(check_plink_bin_filenames(3.14))
  expect_error(check_plink_bin_filenames(c()))
  expect_error(check_plink_bin_filenames(c(1, 2)))
  expect_error(check_plink_bin_filenames(list()))
})
