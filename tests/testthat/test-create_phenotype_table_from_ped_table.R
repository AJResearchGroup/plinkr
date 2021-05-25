test_that("use", {
  if (!is_plink_installed(plink_version = "1.7")) return()
  ped_table <- read_plink_ped_file(
    ped_filename = get_plink_example_filename(
      example_filename = "test.ped",
      plink_version = "1.7"
    )
  )
  phenotype_table <- create_phenotype_table_from_ped_table(ped_table)
  expect_equal(3, ncol(phenotype_table))
  expect_equal(nrow(ped_table), nrow(phenotype_table))
  expect_equal(ped_table$family_id, phenotype_table$family_id)
  expect_equal(ped_table$within_family_id, phenotype_table$within_family_id)

  # Column name too likely to change in the future
  expect_true("case_control_code" %in% names(ped_table))
  expect_equal(ped_table$case_control_code, phenotype_table$case_control_code)
})
