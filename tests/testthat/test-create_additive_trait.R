test_that("use", {
  expect_silent(create_additive_trait())
  expect_silent(create_additive_trait(mafs = 0.01))
  expect_silent(create_additive_trait(n_snps = 1))
  expect_silent(create_additive_trait(base_phenotype_value = 3.14))
  expect_silent(create_additive_trait(phenotype_increase = 2.71))
})
