test_that("use", {
  plink2_bin_data <- create_plink2_bin_data(
    pgen_table = get_test_pgen_table(),
    psam_table = get_test_psam_table(),
    pvar_table = get_test_pvar_table()
  )
  expect_true(is_plink2_bin_data(plink2_bin_data))
})
