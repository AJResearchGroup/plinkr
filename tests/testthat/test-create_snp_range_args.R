test_that("use, SNP window selector", {
  base_output_filename <- get_plinkr_tempfilename()
  args <- create_snp_range_args(
    plink_bin_filenames = create_test_plink_bin_filenames(),
    snp_range_selector = create_test_snp_range_selector(),
    base_output_filename = base_output_filename,
    plink_options = create_plink_options()
  )
})

