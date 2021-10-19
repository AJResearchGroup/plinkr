test_that("use", {
  phenotype_data_table <- create_test_phenotype_data_table()
  check_phenotype_data_table(phenotype_data_table = phenotype_data_table)
  check_phenotype_data(phenotype_data = phenotype_data_table)
  expect_identical(
    phenotype_data_table$phe_table,
    read_plink_phe_file(get_plinkr_filename("pheno_with_standard_header.phe"))
  )
})
