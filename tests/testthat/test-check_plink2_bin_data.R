test_that("use", {
  expect_silent(
    check_plink2_bin_data(
      create_test_plink2_bin_data()
    )
  )
  expect_error(
    check_plink2_bin_data(
      plink2_bin_data = "nonsense"
    )
  )
})
