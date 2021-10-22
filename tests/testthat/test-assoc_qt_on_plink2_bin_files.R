test_that("test data, PLINK2, PLINK2 bin files", {
  expect_silent(check_empty_plinkr_folder())
  if (!is_plink_installed()) return()

  assoc_qt_params <- create_demo_assoc_qt_data()

  if (1 == 2) {
    assoc_qt_params$data <- convert_plink_text_data_to_plink2_bin_data(
      assoc_qt_params$data
    )
    check_plink2_bin_data(assoc_qt_params$data)
    # Create the files needed
    assoc_qt_params$base_input_filename <- "~/assoc_qt_on_plink2_bin_files"
    plink2_bin_filenames <- save_plink2_bin_data(
      plink2_bin_data = assoc_qt_params$data,
      base_input_filename = assoc_qt_params$base_input_filename,
    )
    save_phe_table(
      phe_table = assoc_qt_params$phe_table,
      phe_filename = paste0(base_input_filename, ".phe")
    )
  }

  assoc_qt_params$data <- create_plink2_bin_filenames(
    pgen_filename = get_plinkr_filename("assoc_qt_on_plink2_bin_files.pgen"),
    psam_filename = get_plinkr_filename("assoc_qt_on_plink2_bin_files.psam"),
    pvar_filename = get_plinkr_filename("assoc_qt_on_plink2_bin_files.pvar")
  )
  check_plink2_bin_filenames(assoc_qt_params$data)
  assoc_qt_params$base_input_filename <- tools::file_path_sans_ext(
    get_plinkr_filename("assoc_qt_on_plink2_bin_files.phe")
  )
  assoc_qt_filenames <- assoc_qt_on_plink2_bin_files(
    assoc_qt_params = assoc_qt_params
  )
  skip("'assoc_qt' does not have proper verbose output yet")
  suppressMessages(
    expect_message(
      assoc_qt_on_plink2_bin_files(
        assoc_qt_params = assoc_qt_params,
        plink_options = create_plink_v2_0_options(),
        verbose = TRUE
      ),
      "you should be able to copy paste this"
    )
  )

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})
