test_that("use", {
  expect_silent(
    check_phenotype_data_filename(
      list(
        phe_filename = get_plinkr_filename("pheno_with_standard_header.phe")
      )
    )
  )
  expect_error(
    check_phenotype_data_filename(
      list(phe_table = create_demo_phe_table())
    )
  )
  expect_error(check_phenotype_data_filename(NULL))
  expect_error(check_phenotype_data_filename(NA))
  expect_error(check_phenotype_data_filename(Inf))
  expect_error(check_phenotype_data_filename(c()))
  expect_error(check_phenotype_data_filename(list()))
  expect_error(check_phenotype_data_filename("nonsense"))
  expect_error(check_phenotype_data_filename(42))
})
