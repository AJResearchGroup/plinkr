test_that("use", {
  expect_silent(create_test_assoc_qt_covar_params())
})

test_that("use PLINK1 text data", {
  assoc_qt_covar_params <- create_test_assoc_qt_covar_params(
    data = create_test_plink_text_data()
  )
  expect_silent(check_assoc_qt_covar_params(assoc_qt_covar_params))
})

test_that("use PLINK1 bin data", {
  skip("Cannot 'create_cov_table_from_data' on PLINK1 binary data")
  assoc_qt_covar_params <- create_test_assoc_qt_covar_params(
    data = create_test_plink_bin_data()
  )
  expect_silent(check_assoc_qt_covar_params(assoc_qt_covar_params))
})

test_that("use PLINK2 bin data", {
  skip("Cannot 'create_cov_table_from_data' on PLINK2 binary data")
  assoc_qt_covar_params <- create_test_assoc_qt_covar_params(
    data = create_test_plink2_bin_data()
  )
  expect_silent(check_assoc_qt_covar_params(assoc_qt_covar_params))
})
