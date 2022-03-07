test_that("minimal use", {
  expect_silent(
    create_demo_phe_table()
  )
  expect_silent(
    create_demo_phe_table(
      traits = create_additive_trait()
    )
  )
  expect_silent(
    create_demo_phe_table(
      traits = create_random_trait()
    )
  )
  expect_silent(
    create_demo_phe_table(
      traits = create_demo_traits()
    )
  )
})

test_that("same number of individuals in ped and phenotype tables", {
  ped_table <- create_demo_ped_table(
    traits = create_demo_traits()
  )
  phe_table <- create_demo_phe_table(
    ped_table = ped_table,
    traits = create_demo_traits()
  )
  expect_equal(nrow(ped_table), nrow(phe_table))
})

test_that("MAFs", {
  expect_silent(
    create_demo_phe_table(
      traits = create_random_trait(mafs = c(0.3, 0.2, 0.1))
    )
  )
})

test_that("random trait, 1 SNP", {
  traits <- create_random_trait(n_snps = 1)
  expect_silent(
    create_demo_phe_table(
      traits = traits,
      ped_table = create_demo_ped_table(traits = traits)
    )
  )
})

test_that("random trait, 2 SNPs", {
  traits <- create_random_trait(n_snps = 2)
  expect_silent(
    create_demo_phe_table(
      traits = traits,
      ped_table = create_demo_ped_table(traits = traits)
    )
  )
})
