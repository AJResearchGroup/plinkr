test_that("use", {
  expect_true(
    is_phenotype_data_filename(
      list(
        phe_filename = get_plinkr_filename("pheno_with_standard_header.phe")
      )
    )
  )
  expect_false(
    is_phenotype_data_filename(
      list(phe_table = create_demo_phe_table())
    )
  )
})
