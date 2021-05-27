test_that("use", {
  expect_silent(
    create_demo_phenotype_table_rhs(
      traits = create_random_trait()
    )
  )
  expect_silent(
    create_demo_phenotype_table_rhs(
      traits = create_additive_trait()
    )
  )
  expect_silent(
    create_demo_phenotype_table_rhs(
      traits = create_epistatic_trait()
    )
  )
  expect_silent(create_demo_phenotype_table_rhs())
})
