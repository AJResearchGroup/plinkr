test_that("use", {

  expect_silent(
    check_phenotype_data(
      list(
        phe_filename = get_plinkr_filename("pheno_with_standard_header.phe")
      )
    )
  )
  expect_silent(check_phenotype_data(list(phe_table = create_demo_phe_table())))
  expect_error(check_phenotype_data(NULL))
  expect_error(check_phenotype_data(NA))
  expect_error(check_phenotype_data(Inf))
  expect_error(check_phenotype_data(c()))
  expect_error(check_phenotype_data(list()))
  expect_error(check_phenotype_data(42))
  expect_error(check_phenotype_data("nonsense"))
})
