test_that("use", {
  skip("WIP")
  plink_bin_data <- create_plink_bin_data(
    bim_table = NULL,
    fam_table = NULL,
    bed_table = NULL
  )
  expect_true(is_plink_bin_data(plink_bin_data))
  data <- create_plink2_data(
    bim_table = NULL,
    fam_table = NULL,
    bed_table = NULL
  )
})
