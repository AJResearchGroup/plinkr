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
  phenotype_filename <- get_plinkr_tempfilename()
  save_phenotype_table_to_file(
    phenotype_table = phenotype_table,
    phenotype_filename = phenotype_filename
  )

  phenotypes <- read_plink_phenotype_file(
    phenotype_filename = phenotype_filename
  )

  # The column names FID and IID match the PLINK names of the same
  # data in the phenotype files,
  # https://www.cog-genomics.org/plink/1.9/input#pheno
  expect_true("FID" %in% names(phenotypes))
  expect_true("IID" %in% names(phenotypes))
  expect_true("phenotype_1" %in% names(phenotypes))
  expect_true("phenotype_2" %in% names(phenotypes))
  expect_equal(6, nrow(phenotypes))
  file.remove(phenotype_filename)
})
