test_that("minimal use", {
  expect_silent(create_test_simulate_qt_params())
})

test_that("must be valid", {
  expect_silent(check_simulate_qt_params(create_test_simulate_qt_params()))
})
