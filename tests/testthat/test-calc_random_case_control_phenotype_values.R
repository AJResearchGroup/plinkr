test_that("use", {
  snvs <- tidyr::expand_grid(snp_1a = c("A", "T"), snp_1b = c("A", "T"))
  set.seed(314)
  phenotype_values <- calc_random_case_control_phenotype_values(
    snvs = snvs
  )
  expect_true(all(phenotype_values %in% c(1, 2)))
  expect_true(sum(phenotype_values == 1) > 0)
  expect_true(sum(phenotype_values == 2) > 0)
})

test_that("can use two SNPs", {
  snvs <- tidyr::expand_grid(
    snp_1a = c("A", "A"),
    snp_1b = c("A", "C"),
    snp_2a = c("A", "G"),
    snp_2b = c("A", "T")
  )
  set.seed(314)
  phenotype_values <- calc_random_case_control_phenotype_values(
    snvs = snvs
  )
  expect_true(all(phenotype_values %in% c(1, 2)))
  expect_true(sum(phenotype_values == 1) > 0)
  expect_true(sum(phenotype_values == 2) > 0)
})
