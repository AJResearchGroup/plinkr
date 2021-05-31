test_that("use", {
  expect_silent(create_additive_trait())
  expect_silent(create_additive_trait(maf = 0.01))
  expect_silent(create_additive_trait(n_snps = 1))
})
