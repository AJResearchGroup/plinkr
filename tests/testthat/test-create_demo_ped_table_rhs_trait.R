test_that("use", {
  expect_silent(create_demo_ped_table_rhs_trait())
  expect_silent(create_demo_ped_table_rhs_trait(create_random_trait()))
  expect_silent(create_demo_ped_table_rhs_trait(create_additive_trait()))
  expect_silent(create_demo_ped_table_rhs_trait(create_epistatic_trait()))
  expect_silent(create_demo_ped_table_rhs_trait(n_individuals = 31))
  expect_error(create_demo_ped_table_rhs_trait(create_demo_traits()))
})

test_that("random trait, 1 SNP", {
  t <- create_demo_ped_table_rhs_trait(create_random_trait())
  expect_equal(ncol(t), 2)
})

test_that("random trait, 2 SNPs", {
  t <- create_demo_ped_table_rhs_trait(trait = create_random_trait(n_snps = 2))
  expect_equal(ncol(t), 4)
})

test_that("correct number of columns", {
  expect_equal(
    2,
    ncol(create_demo_ped_table_rhs_trait(create_random_trait()))
  )
  expect_equal(
    2,
    ncol(create_demo_ped_table_rhs_trait(create_additive_trait()))
  )
  expect_equal(
    4,
    ncol(create_demo_ped_table_rhs_trait(create_epistatic_trait()))
  )
})
