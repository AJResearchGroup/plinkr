test_that("use", {
  results <- sim_qt(
    sim_qt_params = create_test_sim_qt_params(),
    n_individuals = 2,
    temp_sim_filename = "temp.sim"
  )
  expect_true(is.list(results))
  expect_true("log" %in% names(results))
  expect_true("simfreq" %in% names(results))
})
