test_that("minimal use", {
  expect_silent(create_test_sim_qtl_params())
})

test_that("must be valid", {
  skip("WIP")
  sim_qtl_params <- create_test_sim_qtl_params()
  expect_true(is_sim_qtl_params(sim_qtl_params))
})
