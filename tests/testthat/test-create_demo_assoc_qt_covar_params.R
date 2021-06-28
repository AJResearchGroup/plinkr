test_that("use", {
  assoc_qt_covar_params <- create_demo_assoc_qt_covar_params()
  expect_silent(check_assoc_qt_covar_params(assoc_qt_covar_params))
})
