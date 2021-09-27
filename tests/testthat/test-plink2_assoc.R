test_that("run", {
  skip("WIP")
  # Create PLINK1 binary files
  map_filename <- get_plinkr_filename("toy_v1_9.map")
  ped_filename <- get_plinkr_filename("toy_v1_9.ped")

  # Convert
  folder_name <- get_plinkr_tempfilename()
  plink_bin_filenames <- convert_plink_text_files_to_plink2_bin_files(
    base_input_filename = tools::file_path_sans_ext(map_filename),
    base_output_filename = file.path(folder_name, "output"),
  )

  # Extract the same knowledge from the binary data
  bim_table <- read_plink_bim_file(plink_bin_filenames$bim_filename)
  fam_table <- read_plink_fam_file(plink_bin_filenames$fam_filename)
  bed_table <- read_plink_bed_file_from_files(
    bed_filename = plink_bin_filenames$bed_filename,
    bim_filename = plink_bin_filenames$bim_filename,
    fam_filename = plink_bin_filenames$fam_filename
  )

  plink2_assoc(
    assoc_params = create_assoc_params(
      data = create_plink2_bin_data()
    )
  )


  unlink(folder_name, recursive = TRUE)
})
