test_that("use, select 1 SNP", {
  base_input_filename <- tools::file_path_sans_ext(get_plinkr_filename("gcaer_issue_2_bin.bed"))
  plink_bin_data <- read_plink_bin_data(base_input_filename = base_input_filename)
  check_plink_bin_data(plink_bin_data)
  # Only selects the SNP
  snp_selector <- create_snp_window_selector(
    snp = "snp3",
    window_kb = 0.001
  )
  new_plink_bin_data <- select_snps(plink_bin_data, snp_selector)
  check_plink_bin_data(new_plink_bin_data)
  expect_equal(1, nrow(new_plink_bin_data$bim_table))
  expect_equal(1, nrow(new_plink_bin_data$bed_table))
})

test_that("use, select 3 SNPs", {
  base_input_filename <- tools::file_path_sans_ext(get_plinkr_filename("gcaer_issue_2_bin.bed"))
  plink_bin_data <- read_plink_bin_data(base_input_filename = base_input_filename)
  check_plink_bin_data(plink_bin_data)
  snp_selector <- create_snp_window_selector(
    snp = "snp3",
    window_kb = 0.002
  )
  new_plink_bin_data <- select_snps(plink_bin_data, snp_selector)
  check_plink_bin_data(new_plink_bin_data)
  expect_equal(3, nrow(new_plink_bin_data$bim_table))
  expect_equal(3, nrow(new_plink_bin_data$bed_table))
})
