test_that("use, test_v1_7_after_make-bed", {
  if (!is_plink_installed(plink_options = create_plink_v2_0_options())) return()

  bed_filename <- get_plinkr_filename("test_v1_7_after_make-bed.bed")
  bim_filename <- get_plinkr_filename("test_v1_7_after_make-bed.bim")
  fam_filename <- get_plinkr_filename("test_v1_7_after_make-bed.fam")

  # What we know about the plain-text data
  bed_table <- read_plink_bed_file_from_files(
    bed_filename = bed_filename,
    bim_filename = bim_filename,
    fam_filename =  fam_filename
  )
  bim_table <- read_plink_bim_file(
    bim_filename = bim_filename
  )
  fam_table <- read_plink_fam_file(
    fam_filename =  fam_filename
  )

  snp_names <- bim_table$id
  n_snps <- length(snp_names)
  individual_ids <- fam_table$id
  n_individuals <- length(individual_ids)

  # Convert
  folder_name <- get_plinkr_tempfilename()
  plink2_bin_filenames <- convert_plink_bin_files_to_plink2_bin_files(
    base_input_filename = tools::file_path_sans_ext(bed_filename),
    base_output_filename = file.path(
      folder_name, "test_v1_7_after_make-bed_after_make-pgen"
    ),
  )


  # Extract the same knowledge from the binary data
  pgen_table <- read_plink2_pgen_file(plink2_bin_filenames$pgen_filename)
  psam_table <- read_plink2_psam_file(plink2_bin_filenames$psam_filename)
  pvar_table <- read_plink2_pvar_file(plink2_bin_filenames$pvar_filename)

  expect_true(all(snp_names %in% pvar_table$ID))
  expect_true(all(individual_ids %in% psam_table$IID))
  # TODO expect_equal(individual_ids, colnames(pgen_table))
  # TODO expect_equal(snp_names, rownames(pgen_table))

  unlink(folder_name, recursive = TRUE)

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})

test_that("use, toy_v1_9_after_make-bed", {
  if (!is_plink_installed(plink_options = create_plink_v2_0_options())) return()

  bed_filename <- get_plinkr_filename("toy_v1_9_after_make-bed.bed")
  bim_filename <- get_plinkr_filename("toy_v1_9_after_make-bed.bim")
  fam_filename <- get_plinkr_filename("toy_v1_9_after_make-bed.fam")

  # What we know about the plain-text data
  bed_table <- read_plink_bed_file_from_files(
    bed_filename = bed_filename,
    bim_filename = bim_filename,
    fam_filename =  fam_filename
  )
  bim_table <- read_plink_bim_file(
    bim_filename = bim_filename
  )
  fam_table <- read_plink_fam_file(
    fam_filename =  fam_filename
  )

  snp_names <- bim_table$id
  n_snps <- length(snp_names)
  individual_ids <- fam_table$id
  n_individuals <- length(individual_ids)

  # Convert
  folder_name <- get_plinkr_tempfilename()
  plink2_bin_filenames <- convert_plink_bin_files_to_plink2_bin_files(
    base_input_filename = tools::file_path_sans_ext(bed_filename),
    base_output_filename = file.path(folder_name, "output"),
  )


  # Extract the same knowledge from the binary data
  pgen_table <- read_plink2_pgen_file(plink2_bin_filenames$pgen_filename)
  psam_table <- read_plink2_psam_file(plink2_bin_filenames$psam_filename)
  pvar_table <- read_plink2_pvar_file(plink2_bin_filenames$pvar_filename)

  expect_true(all(snp_names %in% pvar_table$ID))
  expect_true(all(individual_ids %in% psam_table$IID))
  # TODO expect_equal(individual_ids, colnames(pgen_table))
  # TODO expect_equal(snp_names, rownames(pgen_table))

  unlink(folder_name, recursive = TRUE)

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})
