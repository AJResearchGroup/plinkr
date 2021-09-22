test_that("use", {
  # Extensive testing in 'create_cov_table_from_ped_table'
  data <- create_test_plink_text_data()
  cov_table <- create_cov_table_from_data(data = data)
  cov_table_again <- create_cov_table_from_ped_table(ped_table = data$ped_table)
  expect_identical(cov_table, cov_table_again)
})

test_that("use", {
  skip("Cannot 'create_cov_table_from_data' on PLINK1 binary data")
  data <- create_test_plink_bin_data()
  cov_table <- create_cov_table_from_data(data = data)
  # No idea how to test now
})

test_that("use", {
  skip("Cannot 'create_cov_table_from_data' on PLINK2 binary data")
  data <- create_test_plink2_bin_data()
  # No idea how to test now
})
