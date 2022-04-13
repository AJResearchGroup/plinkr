test_that("use, SNP window selector", {
  base_output_filename <- get_plinkr_tempfilename()
  args <- create_select_snp_window_args(
    plink_bin_filenames = create_test_plink_bin_filenames(),
    snp_window_selector = create_test_snp_window_selector(),
    base_output_filename = base_output_filename,
    plink_options = create_plink_options()
  )
})
