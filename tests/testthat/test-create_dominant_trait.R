test_that("use", {
  expect_silent(create_dominant_trait())
  expect_silent(create_dominant_trait(maf = 0.01))
  expect_silent(create_dominant_trait(n_snps = 1))
})
