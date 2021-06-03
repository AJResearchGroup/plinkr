test_that("1 SNP", {
  # Same as a dominance effect
  snvs <- create_snvs(n_snps = 1, n_individuals = 4)
  regular_phenotype_value <- 3.14
  epistatic_phenotype_value <- 2.71
  phenotype_values <- calc_epistatic_phenotype_values(
    snvs = snvs,
    regular_phenotype_value = regular_phenotype_value,
    epistatic_phenotype_value = epistatic_phenotype_value
  )
  expect_equal(3, sum(phenotype_values == regular_phenotype_value))
  expect_equal(1, sum(phenotype_values == epistatic_phenotype_value))
})

test_that("2 SNPs", {
  snvs <- create_snvs(n_snps = 2, n_individuals = 16)
  regular_phenotype_value <- 3.14
  epistatic_phenotype_value <- 2.71
  phenotype_values <- calc_epistatic_phenotype_values(
    snvs = snvs,
    regular_phenotype_value = regular_phenotype_value,
    epistatic_phenotype_value = epistatic_phenotype_value
  )
  expect_equal(15, sum(phenotype_values == regular_phenotype_value))
  expect_equal(1, sum(phenotype_values == epistatic_phenotype_value))
})
