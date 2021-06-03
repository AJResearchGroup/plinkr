test_that("use, 1 SNP", {
  snvs <- create_snvs(n_snps = 1, n_individuals = 4)
  phenotype_value_recessive <- 31.4
  phenotype_value_dominant <- 27.1
  phenotype_values <- calc_dominant_phenotype_values(
    snvs = snvs,
    phenotype_value_recessive = phenotype_value_recessive,
    phenotype_value_dominant = phenotype_value_dominant
  )
  expect_equal(3, sum(phenotype_values == phenotype_value_dominant))
  expect_equal(1, sum(phenotype_values == phenotype_value_recessive))
})

test_that("use, 2 SNPs", {
  snvs <- create_snvs(n_snps = 2, n_individuals = 16)
  phenotype_value_recessive <- 31.4
  phenotype_value_dominant <- 27.1

  phenotype_value_intermediate <- (phenotype_value_recessive +
    phenotype_value_dominant) / 2.0

  phenotype_values <- calc_dominant_phenotype_values(
    snvs = snvs,
    phenotype_value_recessive = phenotype_value_recessive,
    phenotype_value_dominant = phenotype_value_dominant
  )
  expect_equal(9, sum(phenotype_values == phenotype_value_dominant))
  expect_equal(6, sum(phenotype_values == phenotype_value_intermediate))
  expect_equal(1, sum(phenotype_values == phenotype_value_recessive))
})
