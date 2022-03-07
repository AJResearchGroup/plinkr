test_that("use, PLINK text data", {
  text_data <- create_test_plink_text_data()
  n_snps <- (ncol(text_data$ped_table) - 6) / 2
  expect_equal(get_n_snps(text_data$ped_table), n_snps)
  expect_equal(get_n_snps(text_data$map_table), n_snps)
})

test_that("use, PLINK bin data", {
  plink_bin_data <- create_test_plink_bin_data()
  n_snps <- nrow(plink_bin_data$bim_table)
  expect_equal(get_n_snps(plink_bin_data$bed_table), n_snps)
  expect_equal(get_n_snps(table = plink_bin_data$bim_table), n_snps)
})

test_that("use, PLINK2 bin data", {

  plink2_bin_data <- create_test_plink2_bin_data()
  n_snps <- ncol(plink2_bin_data$pgen_table)
  expect_equal(get_n_snps(plink2_bin_data$pvar_table), n_snps)
  expect_equal(get_n_snps(plink2_bin_data$pgen_table), n_snps)
})
