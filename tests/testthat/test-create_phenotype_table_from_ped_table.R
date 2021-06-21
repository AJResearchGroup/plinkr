test_that("use", {
  if (!is_plink_installed(create_plink_v1_7_options())) return()
  ped_table <- read_plink_ped_file(
    ped_filename = get_plink_example_filename(
      example_filename = "test.ped",
      create_plink_v1_7_options()
    )
  )
  phe_table <- create_phe_table_from_ped_table(ped_table)
  expect_equal(3, ncol(phe_table))
  expect_equal(nrow(ped_table), nrow(phe_table))
  expect_equal(ped_table$FID, phe_table$FID)
  expect_equal(ped_table$IID, phe_table$IID)

  # Column name is renamed to 'trait' and values are divided by ten.
  # This is to prevent PLINK doing a case-control
  # association with a quantitative trait
  expect_true("case_control_code" %in% names(ped_table))
  expect_true("trait" %in% names(phe_table))
  expect_equal(
    ped_table$case_control_code / 10.0,
    phe_table$trait
  )
})
