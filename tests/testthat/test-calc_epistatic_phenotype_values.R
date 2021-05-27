test_that("use", {
  snvs <- tidyr::expand_grid(
    snp_1a = c("A", "T"),
    snp_1b = c("A", "T"),
    snp_2a = c("A", "T"),
    snp_2b = c("A", "T")
  )
  phenotype_values <- calc_epistatic_phenotype_values(
    snvs = snvs
  )
  expect_equal(15, sum(phenotype_values == 20.0))
  expect_equal(1, sum(phenotype_values == 21.0))
})
