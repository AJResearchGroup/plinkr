test_that("use", {
  plink2_bin_data <- create_test_plink2_bin_data()
  plink_bin_data <- convert_plink2_bin_data_to_plink_bin_data(plink2_bin_data)

  plink_bin_data_again <- create_test_plink_bin_data()
  expect_identical(
    plink_bin_data,
    plink_bin_data_again
  )

})
