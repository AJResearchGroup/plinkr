test_that("use", {
  expect_silent(
    create_select_snp_args(
      plink_bin_filenames = create_test_plink_bin_filenames(),
      snp_selector = create_test_single_snp_selector()
    )
  )
  expect_silent(
    create_select_snp_args(
      plink_bin_filenames = create_test_plink_bin_filenames(),
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
