test_that("use", {
  if (!is_plink_installed()) return()
  results <- simulate_qt(
    simulate_qt_params = create_test_simulate_qt_params(),
    n_individuals = 2,
    temp_sim_filename = "temp.sim"
  )
  expect_true(is.list(results))
  expect_true("log" %in% names(results))
  expect_true("simfreq" %in% names(results))
})

test_that("use, v1.7", {
  if (!is_plink_installed(plink_version = "1.7")) return()
  results <- simulate_qt(
    simulate_qt_params = create_test_simulate_qt_params(),
    n_individuals = 2,
    temp_sim_filename = "temp.sim",
    plink_version = "1.7"
  )
  expect_true(is.list(results))
  expect_true("log" %in% names(results))
  expect_true("simfreq" %in% names(results))
})

test_that("use, v1.9", {
  if (!is_plink_installed(plink_version = "1.9")) return()
  results <- simulate_qt(
    simulate_qt_params = create_test_simulate_qt_params(),
    n_individuals = 2,
    temp_sim_filename = "temp.sim",
    plink_version = "1.9"
  )
  expect_true(is.list(results))
  expect_true("log" %in% names(results))
  expect_true("simfreq" %in% names(results))
})
