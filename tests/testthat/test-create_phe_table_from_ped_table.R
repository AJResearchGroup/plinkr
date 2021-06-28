test_that("use", {
  ped_table <- read_plink_ped_file(
    ped_filename = get_plinkr_filename("test_v1_7.ped")
  )
  phe_table <- create_phe_table_from_ped_table(ped_table)
  expect_equal(3, ncol(phe_table))
  expect_equal(nrow(ped_table), nrow(phe_table))
  expect_equal(ped_table$FID, phe_table$FID)
  expect_equal(ped_table$IID, phe_table$IID)

  # PLINK column name for the first unknown phenotype
  expect_true("P1" %in% names(phe_table))
  # Prevent PLINK doing a case-control association with a quantitative trait
  expect_equal(
    ped_table$case_control_code / 10.0,
    phe_table$trait
  )
})
