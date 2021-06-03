test_that("use, 1 SNP", {
  snvs <- create_snvs(n_snps = 1, n_individuals = 4)
  phenotype_values <- calc_additive_phenotype_values(
    snvs = snvs
  )
  expect_equal(phenotype_values, 10 + c(0.0, 0.5, 0.5, 1.0))
})

test_that("use, 2 SNPs", {
  snvs <- create_snvs(n_snps = 2, n_individuals = 16)
  phenotype_values <- calc_additive_phenotype_values(
    snvs = snvs
  )
  expect_true(all(phenotype_values >= 10.0))
})
