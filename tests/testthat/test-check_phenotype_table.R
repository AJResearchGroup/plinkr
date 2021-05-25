test_that("use", {
  phenotype_table <- read_plink_phenotype_file(
    phenotype_filename = get_plinkr_filename("pheno.raw")
  )
  expect_silent(check_phenotype_table(phenotype_table))
})
