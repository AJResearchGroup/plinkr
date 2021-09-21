test_that("use", {
  skip("Cannot create PLINK2 bin data yet")
  expect_silent(create_test_assoc_qt_params_with_plink2_bin_data())
  expect_true(
    is_plink2_bin_data(create_test_assoc_qt_params_with_plink2_bin_data())
  )
})
