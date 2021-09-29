test_that("use", {
  if (!is_plink_installed(plink_options = create_plink_v2_0_options())) return()

  pgen_filename <- get_plinkr_filename(
    "toy_v1_9_after_make-bed_after_make-pgen.pgen"
  )
  psam_filename <- get_plinkr_filename(
    "toy_v1_9_after_make-bed_after_make-pgen.psam"
  )
  pvar_filename <- get_plinkr_filename(
    "toy_v1_9_after_make-bed_after_make-pgen.pvar"
  )

  # What we know about the data
  pgen_table <- read_plink2_pgen_file_from_files(
    pgen_filename = pgen_filename,
    psam_filename = psam_filename,
    pvar_filename = pvar_filename
  )
  psam_table <- read_plink2_psam_file(
    psam_filename = psam_filename
  )
  pvar_table <- read_plink2_pvar_file(
    pvar_filename =  pvar_filename
  )

  snp_names <- pvar_table$ID # nolint PLINK2 notation
  n_snps <- length(snp_names)
  individual_ids <- psam_table$IID # nolint PLINK2 notation
  n_individuals <- length(individual_ids)

  # Convert
  folder_name <- get_plinkr_tempfilename()
  plink_bin_filenames <- convert_plink2_bin_files_to_plink_bin_files(
    base_input_filename = tools::file_path_sans_ext(pgen_filename),
    base_output_filename = file.path(folder_name, "output"),
  )


  # Extract the same knowledge from the binary data
  bed_table <- read_plink_bed_file_from_files(
    bed_filename = plink_bin_filenames$bed_filename,
    bim_filename = plink_bin_filenames$bim_filename,
    fam_filename = plink_bin_filenames$fam_filename
  )
  bim_table <- read_plink_bim_file(plink_bin_filenames$bim_filename)
  fam_table <- read_plink_fam_file(plink_bin_filenames$fam_filename)

  expect_true(all(snp_names %in% bim_table$id))
  expect_true(all(individual_ids %in% fam_table$id))

  expect_equal(individual_ids, colnames(bed_table))
  expect_equal(snp_names, rownames(bed_table))

  unlink(folder_name, recursive = TRUE)

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})
