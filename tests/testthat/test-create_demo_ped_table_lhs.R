test_that("minimal", {
  expect_silent(create_demo_ped_table_lhs())
  expect_silent(create_demo_ped_table_lhs(n_individuals = 2))
})

test_that("use", {
  n_individuals <- 314
  ped_table_lhs <- create_demo_ped_table_lhs(n_individuals = n_individuals)
  expect_equal(nrow(ped_table_lhs), n_individuals)
})
