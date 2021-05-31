test_that("use", {
  expect_silent(create_custom_trait())
  expect_silent(create_custom_trait(maf = 0.01))
  expect_silent(create_custom_trait(n_snps = 1))
  expect_silent(
    create_custom_trait(
      calc_phenotype_function = calc_additive_phenotype_values
    )
  )
})
