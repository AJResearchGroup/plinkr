test_that("use", {
  plink2_bin_data <- create_test_plink2_bin_data()
  plink_text_data <- convert_plink2_bin_data_to_plink_text_data(
    plink2_bin_data
  )
  expect_true(is_plink_text_data(plink_text_data))
})
