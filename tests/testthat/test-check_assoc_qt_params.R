test_that("is silent", {
  expect_silent(create_test_assoc_qt_params())
})

test_that("valid", {
  assoc_qt_params <- create_test_assoc_qt_params()
  expect_silent(check_assoc_qt_params(assoc_qt_params))
})
