test_that("use, 1 SNP", {
  snvs <- tidyr::expand_grid(snp_1a = c("A", "T"), snp_1b = c("A", "T"))
  phenotype_values <- calc_additive_phenotype_values(
    snvs = snvs
  )
  expect_equal(phenotype_values, 10 + c(0.0, 0.5, 0.5, 1.0))
})

test_that("use, 2 SNPs", {
  snvs <- tidyr::expand_grid(
    snp_1a = c("A", "T"),
    snp_1b = c("A", "T"),
    snp_2a = c("A", "T"),
    snp_2b = c("A", "T")
  )
  phenotype_values <- calc_additive_phenotype_values(
    snvs = snvs
  )
  expect_true(all(phenotype_values >= 10.0))
})
