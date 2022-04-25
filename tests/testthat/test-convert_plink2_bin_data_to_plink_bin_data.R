test_that("minimal use", {
  plink2_bin_data <- create_test_plink2_bin_data()

  check_plink2_bin_data(plink2_bin_data)
  expect_equal(2, get_n_snps_from_pgen_table(plink2_bin_data$pgen_table))
  expect_equal(2, get_n_snps(plink2_bin_data$pgen_table))

  plink_bin_data <- convert_plink2_bin_data_to_plink_bin_data(plink2_bin_data)
  check_plink_bin_data(plink_bin_data)
  expect_true(
    "plinkr_datatype" %in%
      names(attributes(plink_bin_data$bed_table))
  )
  expect_false(
    "pgen_table" %in% attributes(plink_bin_data$bed_table)$plinkr_datatype
  )
  expect_equal(2, get_n_snps_from_bed_table(plink_bin_data$bed_table))
  expect_equal(2, get_n_snps(table = plink_bin_data$bed_table))

})

test_that("absent", {
  expect_error(
    convert_plink2_bin_data_to_plink_bin_data(
      plink2_bin_data = create_test_plink2_bin_data(),
      plink_options = create_plink_v1_7_options()
    ),
    "PLINK cannot convert PLINK2 .'.pgen', '.psam' and '.pvar'. files"
  )
})
