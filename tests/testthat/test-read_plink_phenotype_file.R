test_that("use", {
  phenotypes <- read_plink_phenotype_file(
    phenotype_filename = get_plinkr_filename("pheno.raw")
  )
  expect_true("family_id" %in% names(phenotypes))
  expect_true("within_family_id" %in% names(phenotypes))
  expect_true("phenotype_1" %in% names(phenotypes))
  expect_equal(6, nrow(phenotypes))
})

test_that("multiple traits", {
  phenotype_table <- read_plink_phenotype_file(
    phenotype_filename = get_plinkr_filename("pheno.raw")
  )
  phenotype_table$phenotype_2 <- stats::runif(nrow(phenotype_table))
  phenotype_filename <- tempfile()
  save_phenotype_table_to_file(
    phenotype_table = phenotype_table,
    phenotype_filename = phenotype_filename
  )

  phenotypes <- read_plink_phenotype_file(
    phenotype_filename = phenotype_filename
  )

  expect_true("family_id" %in% names(phenotypes))
  expect_true("within_family_id" %in% names(phenotypes))
  expect_true("phenotype_1" %in% names(phenotypes))
  expect_true("phenotype_2" %in% names(phenotypes))
  expect_equal(6, nrow(phenotypes))
})
