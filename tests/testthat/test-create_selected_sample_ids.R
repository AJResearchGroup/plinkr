test_that("use", {
  plink_bin_filenames <- create_plink_bin_filenames(
    bed_filename = get_plinkr_filename("select_snps.bed"),
    bim_filename = get_plinkr_filename("select_snps.bim"),
    fam_filename = get_plinkr_filename("select_snps.fam")
  )
  single_sample_selector <- create_single_sample_selector(
    fid = "C",
    iid = "1"
  )
  sample_ids <- create_selected_sample_ids(
    plink_bin_filenames = plink_bin_filenames,
    sample_selector = single_sample_selector
  )
  check_sample_ids(sample_ids)
  expect_equal(
    single_sample_selector$fid,
    as.character(sample_ids[1, 1])
  )
  expect_equal(
    single_sample_selector$iid,
    as.character(sample_ids[1, 2])
  )
})
