test_that("minimal", {
  expect_silent(
    check_assoc_qt_covar_params(
      assoc_qt_covar_params = create_test_assoc_qt_covar_params()
    )
  )
})
