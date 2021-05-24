test_that("is silent", {
  expect_silent(get_test_assoc_qt_params())
})

test_that("valid", {
  assoc_qt_params <- get_test_assoc_qt_params()
  expect_silent(check_assoc_qt_params(assoc_qt_params))
})
