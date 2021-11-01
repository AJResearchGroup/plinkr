test_that("use", {
  assoc_qt_covar_data <- create_demo_assoc_qt_covar_data()
  expect_silent(check_assoc_qt_covar_data(assoc_qt_covar_data))
})
