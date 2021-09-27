test_that("use", {
  if (!is_plink_installed(plink_options = create_plink_v1_9_options())) return()
  if (!is_plink_installed(plink_options = create_plink_v2_0_options())) return()


  map_filename <- get_plinkr_filename("toy_v1_9.map")
  ped_filename <- get_plinkr_filename("toy_v1_9.ped")

  # What we know about the plain-text data
  snp_names <- read_plink_map_file(map_filename)$SNP
  n_snps <- length(snp_names)
  individual_ids <- format(
    read_plink_ped_file(ped_filename)$IID,
    scientific = FALSE
  )
  n_individuals <- length(individual_ids)

  # Convert
  folder_name <- get_plinkr_tempfilename()
  plink2_bin_filenames <- convert_plink_text_files_to_plink2_bin_files(
    base_input_filename = tools::file_path_sans_ext(map_filename),
    base_output_plink2_filename = file.path(folder_name, "output")
  )

  # Extract the same knowledge from the binary data
  pgen_table <- read_plink2_pgen_file(plink2_bin_filenames$pgen_filename)
  psam_table <- read_plink2_psam_file(plink2_bin_filenames$psam_filename)
  pvar_table <- read_plink2_pvar_file(plink2_bin_filenames$pvar_filename)

  expect_true(all(snp_names %in% pvar_table$ID))
  expect_true(all(individual_ids %in% psam_table$IID))
  if (1 == 2) {
    # TODO: pgen_table should have column and row names
    expect_equal(individual_ids, colnames(pgen_table))
    expect_equal(snp_names, rownames(pgen_table))
  }

  unlink(folder_name, recursive = TRUE)

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})
