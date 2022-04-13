test_that("use", {
  args <- create_select_random_snp_args(
    plink_bin_filenames = plink_bin_filenames,
    random_snp_selector = create_test_random_snp_selector()
  )
})
