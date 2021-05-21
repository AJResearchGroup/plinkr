test_that("use", {
  expect_silent(
    read_plink_phenotype_file(
      phenotype_filename = get_plinkr_filename("pheno.raw")
    )
  )
})
