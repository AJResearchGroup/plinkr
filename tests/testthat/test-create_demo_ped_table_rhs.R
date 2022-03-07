test_that("use", {
  expect_silent(create_demo_ped_table_rhs())
  expect_silent(create_demo_ped_table_rhs(create_random_trait()))
  expect_silent(create_demo_ped_table_rhs(create_random_trait(n_snps = 1)))
  expect_silent(create_demo_ped_table_rhs(create_additive_trait()))
  expect_silent(create_demo_ped_table_rhs(create_demo_traits()))
  expect_silent(create_demo_ped_table_rhs(n_individuals = 31))
  expect_error(create_demo_ped_table_rhs(create_random_trait(n_snps = 0)))
})
