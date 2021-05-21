test_that("use", {
  phenotypes <- read_plink_phenotype_file(
    phenotype_filename = get_plinkr_filename("pheno.raw")
  )
  expect_true("family_id" %in% names(phenotypes))
  expect_true("individual_id" %in% names(phenotypes))
  expect_true("phenotype" %in% names(phenotypes))
  expect_equal(6, nrow(phenotypes))
})
