test_that("use", {
  expect_silent(
    create_select_snp_args(
      plink_bin_filenames = create_test_plink_bin_filenames(),
      snp_selector = create_test_single_snp_selector()
    )
  )
  expect_silent(
    create_select_snp_args(
      plink_bin_filenames = create_plink_bin_filenames(
        bed_filename = get_plinkr_filename("select_snps.bed"),
        bim_filename = get_plinkr_filename("select_snps.bim"),
        fam_filename = get_plinkr_filename("select_snps.fam")
      ),
      snp_selector = create_test_random_snp_selector()
    )
  )

  expect_silent(
    create_select_snp_args(
      plink_bin_filenames = create_test_plink_bin_filenames(),
      snp_selector = create_test_snp_range_selector()
    )
  )
  expect_silent(
    create_select_snp_args(
      plink_bin_filenames = create_test_plink_bin_filenames(),
      snp_selector = create_test_snp_window_selector()
    )
  )
})
