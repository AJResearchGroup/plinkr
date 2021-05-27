test_that("minimal use", {
  expect_silent(
    create_demo_phenotype_table()
  )
  expect_silent(
    create_demo_phenotype_table(
      traits = create_additive_trait()
    )
  )
  expect_silent(
    create_demo_phenotype_table(
      traits = create_random_trait()
    )
  )
  expect_silent(
    create_demo_phenotype_table(
      traits = create_demo_traits()
    )
  )
})

test_that("same number of individuals in ped and phenotype tables", {
  ped_table <- create_demo_ped_table(
    traits = create_demo_traits()
  )
  phenotype_table <- create_demo_phenotype_table(
    ped_table = ped_table,
    traits = create_demo_traits()
  )
  expect_equal(nrow(ped_table), nrow(phenotype_table))
})
