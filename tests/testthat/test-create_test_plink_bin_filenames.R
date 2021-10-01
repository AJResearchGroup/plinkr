test_that("use", {
  expect_silent(create_test_plink_bin_filenames())
  expect_silent(check_plink_bin_filenames(create_test_plink_bin_filenames()))
})
