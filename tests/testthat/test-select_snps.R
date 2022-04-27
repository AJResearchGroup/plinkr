test_that("single SNP selector", {
  if (!is_plink_installed()) return()

  plink_bin_filenames <- create_plink_bin_filenames(
    bed_filename = get_plinkr_filename("select_snps.bed"),
    bim_filename = get_plinkr_filename("select_snps.bim"),
    fam_filename = get_plinkr_filename("select_snps.fam")
  )
  single_snp_selector <- create_single_snp_selector(
    snp = "snp_4"
  )
  new_plink_bin_data <- select_snps(
    data = plink_bin_filenames,
    snp_selector = single_snp_selector
  )
  expect_equal(1, nrow(new_plink_bin_data$bim_table))
  expect_equal(1, nrow(new_plink_bin_data$bed_table))
})

test_that("random SNP selector", {
  if (!is_plink_installed()) return()

  plink_bin_filenames <- create_plink_bin_filenames(
    bed_filename = get_plinkr_filename("select_snps.bed"),
    bim_filename = get_plinkr_filename("select_snps.bim"),
    fam_filename = get_plinkr_filename("select_snps.fam")
  )
  random_snps_selector <- create_random_snps_selector(
    n_snps = 3
  )
  new_plink_bin_data <- select_snps(
    data = plink_bin_filenames,
    snp_selector = random_snps_selector
  )
  expect_equal(3, nrow(new_plink_bin_data$bim_table))
  expect_equal(3, nrow(new_plink_bin_data$bed_table))
})

test_that("SNP range selector", {
  if (!is_plink_installed()) return()

  plink_bin_filenames <- create_plink_bin_filenames(
    bed_filename = get_plinkr_filename("select_snps.bed"),
    bim_filename = get_plinkr_filename("select_snps.bim"),
    fam_filename = get_plinkr_filename("select_snps.fam")
  )
  snp_range_selector <- create_snp_range_selector(
    snp_from = "snp_2",
    snp_to = "snp_7"
  )
  new_plink_bin_data <- select_snps(
    data = plink_bin_filenames,
    snp_selector = snp_range_selector
  )
  expect_equal(6, nrow(new_plink_bin_data$bim_table))
  expect_equal(6, nrow(new_plink_bin_data$bed_table))
})

test_that("use, from files, window of 0.001 is 1 SNP", {
  if (!is_plink_installed()) return()

  plink_bin_filenames <- create_plink_bin_filenames(
    bed_filename = get_plinkr_filename("select_snps.bed"),
    bim_filename = get_plinkr_filename("select_snps.bim"),
    fam_filename = get_plinkr_filename("select_snps.fam")
  )
  # Only selects the SNP
  snp_window_selector <- create_snp_window_selector(
    snp = "snp_5",
    window_kb = 0.001
  )
  new_plink_bin_data <- select_snps(
    data = plink_bin_filenames,
    snp_selector = snp_window_selector
  )
  expect_equal(1, nrow(new_plink_bin_data$bim_table))
  expect_equal(1, nrow(new_plink_bin_data$bed_table))
})

test_that("use, from files, window of 0.002 = 3 SNP", {
  if (!is_plink_installed()) return()

  plink_bin_filenames <- create_plink_bin_filenames(
    bed_filename = get_plinkr_filename("select_snps.bed"),
    bim_filename = get_plinkr_filename("select_snps.bim"),
    fam_filename = get_plinkr_filename("select_snps.fam")
  )
  check_plink_bin_filenames(plink_bin_filenames)
  # Only selects the SNP
  snp_window_selector <- create_snp_window_selector(
    snp = "snp_5",
    window_kb = 0.002
  )
  new_plink_bin_data <- select_snps(
    data = plink_bin_filenames,
    snp_selector = snp_window_selector
  )
  check_plink_bin_data(new_plink_bin_data)
  expect_equal(3, nrow(new_plink_bin_data$bim_table))
  expect_equal(3, nrow(new_plink_bin_data$bed_table))
})

test_that("use, from files, window of 0.003 = 3 SNP", {
  if (!is_plink_installed()) return()

  plink_bin_filenames <- create_plink_bin_filenames(
    bed_filename = get_plinkr_filename("select_snps.bed"),
    bim_filename = get_plinkr_filename("select_snps.bim"),
    fam_filename = get_plinkr_filename("select_snps.fam")
  )
  check_plink_bin_filenames(plink_bin_filenames)
  # Only selects the SNP
  snp_window_selector <- create_snp_window_selector(
    snp = "snp_5",
    window_kb = 0.003
  )
  new_plink_bin_data <- select_snps(
    data = plink_bin_filenames,
    snp_selector = snp_window_selector
  )
  expect_equal(3, nrow(new_plink_bin_data$bim_table))
  expect_equal(3, nrow(new_plink_bin_data$bed_table))
})

test_that("use, from data, select 1 SNP", {
  if (!is_plink_installed()) return()

  base_input_filename <- tools::file_path_sans_ext(
    get_plinkr_filename("select_snps.bed")
  )
  plink_bin_data <- read_plink_bin_data(
    base_input_filename = base_input_filename
  )
  check_plink_bin_data(plink_bin_data)
  # Only selects the SNP
  snp_window_selector <- create_snp_window_selector(
    snp = "snp_5",
    window_kb = 0.001
  )
  new_plink_bin_data <- select_snps(
    data = plink_bin_data,
    snp_selector = snp_window_selector
  )
  check_plink_bin_data(new_plink_bin_data)
  expect_equal(1, nrow(new_plink_bin_data$bim_table))
  expect_equal(1, nrow(new_plink_bin_data$bed_table))
})

test_that("use, select 3 SNPs", {
  if (!is_plink_installed()) return()

  base_input_filename <- tools::file_path_sans_ext(
    get_plinkr_filename("select_snps.bed")
  )
  plink_bin_data <- read_plink_bin_data(
    base_input_filename = base_input_filename
  )
  snp_selector <- create_snp_window_selector(
    snp = "snp_5",
    window_kb = 0.002
  )
  new_plink_bin_data <- select_snps(
    data = plink_bin_data,
    snp_selector = snp_selector
  )
  expect_equal(3, nrow(new_plink_bin_data$bim_table))
  expect_equal(3, nrow(new_plink_bin_data$bed_table))
})

test_that("create the dataset", {
  if (!is_plink_installed()) return()
  return() # Just re-run when needed
  set.seed(42)
  base_input_filename <- file.path(
    dirname(get_plinkr_filenames()[1]),
    "select_snps"
  )
  gcaer::create_gcae_input_files_1(
    base_input_filename = base_input_filename,
    n_individuals = 100,
    n_traits = 1,
    n_snps_per_trait = 10
  )
})
