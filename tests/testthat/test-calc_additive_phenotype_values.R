test_that("use", {
  snvs <- tidyr::expand_grid(snp_1a = c("A", "T"), snp_1b = c("A", "T"))
  phenotype_values <- calc_additive_phenotype_values(
    snvs = snvs
  )
  expect_equal(phenotype_values, c(0.0, 0.5, 0.5, 1.0))
})
