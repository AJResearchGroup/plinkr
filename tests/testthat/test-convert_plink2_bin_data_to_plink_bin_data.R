test_that("minimal use", {
  plink2_bin_data <- create_test_plink2_bin_data()
  plink_bin_data <- convert_plink2_bin_data_to_plink_bin_data(plink2_bin_data)
  check_plink_bin_data(plink_bin_data)
})
