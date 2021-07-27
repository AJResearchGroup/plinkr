test_that("use", {
  # No need for a FAM file?
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
  plink_binary_filenames <- convert_plink_text_files_to_plink_binary_files(
    base_input_filename = tools::file_path_sans_ext(map_filename),
    base_output_filename = file.path(folder_name, "output"),
  )

  # Extract the same knowledge from the binary data
  bim_table <- read_plink_bim_file(plink_binary_filenames$bim_filename)
  fam_table <- read_plink_fam_file(plink_binary_filenames$fam_filename)
  bed_table <- read_plink_bed_file_from_files(
    bed_filename = plink_binary_filenames$bed_filename,
    bim_filename = plink_binary_filenames$bim_filename,
    fam_filename = plink_binary_filenames$fam_filename
  )

  expect_true(all(snp_names %in% bim_table$id))
  expect_true(all(individual_ids %in% fam_table$id))
  expect_equal(individual_ids, colnames(bed_table))
  expect_equal(snp_names, rownames(bed_table))

  unlink(folder_name, recursive = TRUE)
  if (get_os() != "win") expect_silent(check_empty_plinkr_folder())
})
