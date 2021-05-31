test_that("use", {
  snvs <- tidyr::expand_grid(snp_1a = c("A", "T"), snp_1b = c("A", "T"))
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
  snvs <- tidyr::expand_grid(
    snp_1a = c("A", "A"),
    snp_1b = c("A", "C"),
    snp_2a = c("A", "G"),
    snp_2b = c("A", "T")
  )
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
