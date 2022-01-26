test_that("use", {
  plink_bin_data <- create_test_plink_bin_data()
  ped_table <- convert_plink_bin_data_to_ped_table(
    plink_bin_data = plink_bin_data
  )
  expect_silent(check_ped_table(ped_table))
})
