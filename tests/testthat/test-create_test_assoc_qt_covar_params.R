test_that("use", {
  expect_silent(
    check_assoc_qt_covar_params(
      create_test_assoc_qt_covar_params()
    )
  )
})
