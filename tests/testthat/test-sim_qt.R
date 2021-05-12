test_that("use", {
  sim_qtl_params  <- create_test_sim_qtl_params()
  skip("WIP")
  results <- sim_qt(
    sim_qtl_params = sim_qtl_params,
    n_individuals = 2
  )
  expect_true(is.list(results))
  expect_true("log" %in% names(results))
  expect_true("simfreq" %in% names(results))
})
