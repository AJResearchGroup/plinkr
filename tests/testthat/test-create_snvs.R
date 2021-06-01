test_that("minimal use", {
  expect_silent(create_snvs())
  expect_silent(create_snvs(n_snps = 2))
  expect_silent(create_snvs(n_individuals = 2))
})

test_that("2 individuals", {
  snvs <- create_snvs(n_individuals = 2)
  expect_equal(2, nrow(snvs))
})

test_that("2 SNPs", {
  snvs <- create_snvs(n_snps = 2)
  expect_equal(4, ncol(snvs))
})
