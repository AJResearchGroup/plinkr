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

test_that("random, 1 SNP", {
  traits <- create_random_trait(n_snps = 1)
  expect_silent(
    create_demo_phenotype_table_rhs(
      traits = traits,
      ped_table = create_demo_ped_table(traits = traits)
    )
  )
})

test_that("random, 2 SNPs", {
  skip("WIP")
  traits <- create_random_trait(n_snps = 2)
  expect_silent(
    create_demo_phenotype_table_rhs(
      traits = traits,
      ped_table = create_demo_ped_table(traits = traits)
    )
  )
})
