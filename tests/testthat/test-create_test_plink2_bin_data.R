test_that("minimal", {
  expect_silent(create_test_plink2_bin_data())
  expect_silent(check_plink2_bin_data(create_test_plink2_bin_data()))

  check_empty_plinkr_folder()
})
