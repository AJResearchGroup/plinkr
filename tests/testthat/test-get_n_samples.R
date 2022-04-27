test_that("use, PLINK text data", {
  text_data <- create_test_plink_text_data()
  n_samples <- nrow(text_data$ped_table)
  expect_equal(get_n_samples(table = text_data$ped_table), n_samples)
  expect_error(get_n_samples(table = text_data$map_table))
})

test_that("use, PLINK bin data", {
  plink_bin_data <- create_test_plink_bin_data()
  n_samples <- nrow(plink_bin_data$fam_table)
  expect_equal(get_n_samples(table = plink_bin_data$bed_table), n_samples)
  expect_error(get_n_samples(table = plink_bin_data$bim_table))
  expect_equal(get_n_samples(table = plink_bin_data$fam_table), n_samples)
})

test_that("use, PLINK2 bin data", {

  plink2_bin_data <- create_test_plink2_bin_data()
  n_samples <- nrow(plink2_bin_data$psam_table)
  expect_equal(get_n_samples(table = plink2_bin_data$pgen_table), n_samples)
  expect_equal(get_n_samples(table = plink2_bin_data$psam_table), n_samples)
  expect_error(get_n_samples(plink2_bin_data$pvar_table))
})
