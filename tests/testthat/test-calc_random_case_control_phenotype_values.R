test_that("use", {
  snvs <- create_snvs(n_snps = 1, n_individuals = 4)
  set.seed(314)
  phenotype_values <- calc_random_case_control_phenotype_values(
    snvs = snvs
  )
  expect_true(all(phenotype_values %in% c(1, 2)))
  expect_true(sum(phenotype_values == 1) > 0)
  expect_true(sum(phenotype_values == 2) > 0)
})

test_that("can use two SNPs", {
  snvs <- create_snvs(n_snps = 2, n_individuals = 16)
  set.seed(314)
  phenotype_values <- calc_random_case_control_phenotype_values(
    snvs = snvs
  )
  expect_true(all(phenotype_values %in% c(1, 2)))
  expect_true(sum(phenotype_values == 1) > 0)
  expect_true(sum(phenotype_values == 2) > 0)
})
