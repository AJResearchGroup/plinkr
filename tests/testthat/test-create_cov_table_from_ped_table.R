test_that("use", {
  ped_table <- read_plink_ped_file(
    ped_filename = get_plinkr_filename("test_v1_7.ped")
  )
  cov_table <- create_cov_table_from_ped_table(ped_table)
  expect_equal(3, ncol(cov_table))
  expect_equal(nrow(ped_table), nrow(cov_table))
  expect_equal(ped_table$FID, cov_table$FID)
  expect_equal(ped_table$IID, cov_table$IID)
  # I use C1 as PLINK uses P1 as a default column name
  # for a phenotype file
  expect_true("C1" %in% names(cov_table))
})
