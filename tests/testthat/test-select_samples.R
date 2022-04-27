test_that("single sample selector", {
  if (!is_plink_installed()) return()
  plink_bin_filenames <- create_plink_bin_filenames(
    bed_filename = get_plinkr_filename("select_snps.bed"),
    bim_filename = get_plinkr_filename("select_snps.bim"),
    fam_filename = get_plinkr_filename("select_snps.fam")
  )
  expect_silent(
    read_plink_bin_data(
      tools::file_path_sans_ext(plink_bin_filenames$bed_filename)
    )
  )
  single_sample_selector <- create_single_sample_selector(
    fid = "C",
    iid = "1"
  )
  new_plink_bin_data <- select_samples(
    data = plink_bin_filenames,
    sample_selector = single_sample_selector
  )
  expect_equal(1, get_n_samples(new_plink_bin_data$fam_table))
  expect_equal(1, get_n_samples(new_plink_bin_data$bed_table))
})

test_that("random sample selector", {
  if (!is_plink_installed()) return()
  skip("#42")

  plink_bin_filenames <- create_plink_bin_filenames(
    bed_filename = get_plinkr_filename("select_snps.bed"),
    bim_filename = get_plinkr_filename("select_snps.bim"),
    fam_filename = get_plinkr_filename("select_snps.fam")
  )
  n_samples <- 3
  random_samples_selector <- create_random_samples_selector(
    n_samples = n_samples
  )
  new_plink_bin_data <- select_samples(
    data = plink_bin_filenames,
    sample_selector = random_samples_selector
  )
  expect_equal(n_samples, get_n_samples(new_plink_bin_data$fam_table))
  expect_equal(n_samples, get_n_samples(new_plink_bin_data$bed_table))
})
