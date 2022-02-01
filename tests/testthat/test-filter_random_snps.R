test_that("use", {
  skip(" Allow subsetting on random SNPs, Issue #33, Issue 33")
  assoc_qt_data <- create_demo_assoc_qt_data(
    traits = rep(list(create_random_trait()), 10)
  )
  assoc_qt_data$data <- convert_plink_text_data_to_plink_bin_data(
    assoc_qt_data$data
  )
  base_input_filename <- file.path(
    plinkr::get_plinkr_tempfilename(),
    "plink_bin_input"
  )
  plink_bin_filenames <- save_plink_bin_data(
    base_input_filename = base_input_filename,
    plink_bin_data = assoc_qt_data$data
  )
  base_output_filename <- file.path(
    get_plinkr_tempfilename(),
    "filter_random_snps"
  )
  n_snps <- 2
  plink_bin_filenames_of_subset <- filter_random_snps(
    base_input_filename = base_input_filename,
    base_output_filename = base_output_filename,
    n_snps = n_snps,
    verbose = FALSE
  )
  check_plink_bin_filenames(plink_bin_filenames_of_subset)
  plink_bin_data_of_subset <- plinkr::read_plink_bin_data(
    base_input_filename = tools::file_path_sans_ext(
      plink_bin_filenames_of_subset$bed_filename
    )
  )
  # Check if number of SNPs is correct
})
