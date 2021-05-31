test_that("use", {
  if (!is_plink_installed()) return()
  results <- simulate_qt(
    simulate_qt_params = create_test_simulate_qt_params(),
    n_individuals = 2
  )
  expect_true(is.list(results))
  expect_true("log" %in% names(results))
  expect_true("simfreq" %in% names(results))
})

test_that("use, v1.7", {
  if (!is_plink_installed(create_plink_v1_7_options())) return()
  results <- simulate_qt(
    simulate_qt_params = create_test_simulate_qt_params(),
    n_individuals = 2,
    plink_options = create_plink_v1_7_options()
  )
  expect_true(is.list(results))
  expect_true("log" %in% names(results))
  expect_true("simfreq" %in% names(results))
})

test_that("use, v1.9", {
  if (!is_plink_installed(create_plink_v1_9_options())) return()
  results <- simulate_qt(
    simulate_qt_params = create_test_simulate_qt_params(),
    n_individuals = 2,
    plink_options = create_plink_v1_9_options()
  )
  expect_true(is.list(results))
  expect_true("log" %in% names(results))
  expect_true("simfreq" %in% names(results))
})
