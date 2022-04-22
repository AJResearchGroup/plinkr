test_that("use", {
  plink2_bin_data <- create_test_plink2_bin_data()
  n_snps <- ncol(plink2_bin_data$pgen_table)
  expect_true(has_pgen_table_attributes(plink2_bin_data$pgen_table))
  expect_equal(get_n_snps_from_pgen_table(plink2_bin_data$pgen_table), n_snps)
})
