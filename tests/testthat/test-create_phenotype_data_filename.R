test_that("use", {
  phenotype_data_filename <- create_phenotype_data_filename(
    phe_filename = get_plinkr_filename("pheno_with_standard_header.phe")
  )
  expect_silent(check_phenotype_data_filename(phenotype_data_filename))
  expect_silent(check_phenotype_data(phenotype_data_filename))
  expect_equal(
    phenotype_data_filename$phe_filename,
    get_plinkr_filename("pheno_with_standard_header.phe")
  )
})
