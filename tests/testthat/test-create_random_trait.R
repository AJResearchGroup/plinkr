test_that("use", {
  expect_silent(create_random_trait())
  expect_silent(create_random_trait(maf = 0.01))
})
