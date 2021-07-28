test_that("use", {
  expect_silent(
    create_plink_bin_data(
      bim_table = get_test_bim_table(),
      fam_table = get_test_fam_table(),
      bed_table = get_test_bed_table()
    )
  )
  expect_error(
    create_plink_bin_data(
      bim_table = "nonsense",
      fam_table = get_test_fam_table(),
      bed_table = get_test_bed_table()
    )
  )
  expect_error(
    create_plink_bin_data(
      bim_table = get_test_bim_table(),
      fam_table = "nonsense",
      bed_table = get_test_bed_table()
    )
  )
  expect_error(
    create_plink_bin_data(
      bim_table = get_test_bim_table(),
      fam_table = get_test_fam_table(),
      bed_table = "nonsense"
    )
  )
})
