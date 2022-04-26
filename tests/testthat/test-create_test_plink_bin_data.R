test_that("use", {
  expect_silent(create_test_plink_bin_data())
  expect_silent(check_plink_bin_data(create_test_plink_bin_data()))
})
