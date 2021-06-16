test_that("use", {
  if (!is_plink_installed(create_plink_v1_7_options())) return()
  ped_table <- read_plink_ped_file(
    ped_filename = get_plink_example_filename(
      example_filename = "test.ped",
      create_plink_v1_7_options()
    )
  )
  phenotype_table <- create_phenotype_table_from_ped_table(ped_table)
  expect_equal(3, ncol(phenotype_table))
  expect_equal(nrow(ped_table), nrow(phenotype_table))
  expect_equal(ped_table$family_id, phenotype_table$family_id)
  expect_equal(ped_table$IID, phenotype_table$IID)

  # Column name is renamed to 'trait' and values are divided by ten.
  # This is to prevent PLINK doing a case-control
  # association with a quantitative trait
  expect_true("case_control_code" %in% names(ped_table))
  expect_true("trait" %in% names(phenotype_table))
  expect_equal(
    ped_table$case_control_code / 10.0,
    phenotype_table$trait
  )
})
