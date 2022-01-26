test_that("minimal use", {
  plink2_bin_data <- create_test_plink2_bin_data()
  plink_bin_data <- convert_plink2_bin_data_to_plink_bin_data(plink2_bin_data)
  check_plink_bin_data(plink_bin_data)
})

test_that("abse", {
  expect_error(
    convert_plink2_bin_data_to_plink_bin_data(
      plink2_bin_data = create_test_plink2_bin_data(),
      plink_options = create_plink_v1_7_options()
    ),
    "PLINK cannot convert PLINK2 .'.pgen', '.psam' and '.pvar'. files"
  )
})
