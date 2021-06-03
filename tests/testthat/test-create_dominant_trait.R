test_that("use", {
  expect_silent(create_dominant_trait())
  expect_silent(create_dominant_trait(mafs = 0.01))
  expect_silent(create_dominant_trait(n_snps = 1))
  expect_silent(create_dominant_trait(phenotype_value_recessive = 3.14))
  expect_silent(create_dominant_trait(phenotype_value_dominant = 2.71))
})
