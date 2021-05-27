test_that("use", {
  expect_silent(create_demo_ped_table_rhs_trait())
  expect_silent(create_demo_ped_table_rhs_trait(create_random_trait()))
  expect_silent(create_demo_ped_table_rhs_trait(create_additive_trait()))
  expect_silent(create_demo_ped_table_rhs_trait(n_individuals = 31))
  expect_error(create_demo_ped_table_rhs_trait(create_demo_traits()))
})
