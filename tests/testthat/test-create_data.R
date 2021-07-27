test_that("use", {
  skip("WIP")
  data <- create_plink_text_data(
    ped_table = get_test_ped_table(),
    map_table = get_test_map_table()
  )

  data <- create_plink_bin_data(
    bim_table = NULL,
    fam_table = NULL,
    bed_table = NULL
  )

  data <- create_plink2_data(
    bim_table = NULL,
    fam_table = NULL,
    bed_table = NULL
  )
})
