test_that("use", {
  plink_bin_data <- create_test_plink_bin_data()
  expect_true(is_plink_bin_data(plink_bin_data))
})
