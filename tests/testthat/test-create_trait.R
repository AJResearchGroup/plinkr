test_that("use", {
  expect_silent(create_trait(phenotype = "random"))
  expect_silent(create_trait(phenotype = "random", maf = 0.25))
})
