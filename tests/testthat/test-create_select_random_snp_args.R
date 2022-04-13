test_that("use", {
  args <- create_select_random_snp_args(
    plink_bin_filenames = create_plink_bin_filenames(
      bed_filename = get_plinkr_filename("select_snps.bed"),
      bim_filename = get_plinkr_filename("select_snps.bim"),
      fam_filename = get_plinkr_filename("select_snps.fam")
    ),
    random_snp_selector = create_test_random_snp_selector()
  )
})
