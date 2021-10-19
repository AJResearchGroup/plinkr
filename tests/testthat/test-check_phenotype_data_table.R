test_that("use", {
  expect_silent(
    check_phenotype_data_table(
      list(phe_table = create_demo_phe_table())
    )
  )
  expect_error(
    check_phenotype_data_table(
      list(
        phe_filename = get_plinkr_filename("pheno_with_standard_header.phe")
      )
    )
  )
  expect_error(check_phenotype_data_table(NULL))
  expect_error(check_phenotype_data_table(NA))
  expect_error(check_phenotype_data_table(Inf))
  expect_error(check_phenotype_data_table(c()))
  expect_error(check_phenotype_data_table(list()))
  expect_error(check_phenotype_data_table("nonsense"))
  expect_error(check_phenotype_data_table(42))
})
