test_that("use", {
  expect_silent(create_epistatic_trait())
  expect_silent(create_epistatic_trait(mafs = 0.4))
  expect_silent(create_epistatic_trait(n_snps = 1))
  expect_silent(create_epistatic_trait(regular_phenotype_value = 3.14))
  expect_silent(create_epistatic_trait(epistatic_phenotype_value = 2.71))
})
