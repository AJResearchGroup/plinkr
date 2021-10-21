test_that("use, PLINK text data", {
  expect_silent(
    check_phenotype_data_table(
      create_phenotype_data_table_from_data(
        data = create_test_plink_text_data()
      )
    )
  )
})

test_that("use, PLINK bin data", {
  expect_silent(
    check_phenotype_data_table(
      create_phenotype_data_table_from_data(
        data = create_test_plink_bin_data()
      )
    )
  )
})

test_that("use, PLINK2 bin data", {
  expect_silent(
    check_phenotype_data_table(
      create_phenotype_data_table_from_data(
        data = create_test_plink2_bin_data()
      )
    )
  )
})

