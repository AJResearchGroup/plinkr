test_that("use", {
  snvs <- create_snvs(n_snps = 1, n_individuals = 4)
  set.seed(314)
  phenotype_values <- calc_random_phenotype_values(
    snvs = snvs
  )
  # All random values are unique
  expect_equal(
    unique(length(phenotype_values)),
    length(phenotype_values)
  )
})

test_that("can use two SNPs", {
  snvs <- create_snvs(n_snps = 2, n_individuals = 16)
  set.seed(314)
  phenotype_values <- calc_random_phenotype_values(
    snvs = snvs
  )
  # All random values are unique
  expect_equal(
    unique(length(phenotype_values)),
    length(phenotype_values)
  )
})
