test_that("use", {
  skip("WIP")
  sim_qtl_params  <- create_test_sim_qtl_params()
  results <- sim_qt(
    sim_qtl_params = sim_qtl_params,
    n_individuals = 2
  )
  expect_true(is.list(results))
  expect_true("log" %in% names(results))
  expect_true("simfreq" %in% names(results))
})
