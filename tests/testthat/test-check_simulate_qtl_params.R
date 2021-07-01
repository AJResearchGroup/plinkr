test_that("must be valid", {
  expect_silent(check_simulate_qt_params(create_test_simulate_qt_params()))
  expect_silent(check_empty_plinkr_folder())
})
