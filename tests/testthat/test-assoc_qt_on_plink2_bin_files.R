test_that("test data, PLINK2, PLINK2 bin files", {
  expect_silent(check_empty_plinkr_folder())
  if (!is_plink_installed()) return()
  skip("assoc_qt_on_plink2_bin_files. HIERO")

  assoc_qt_params <- create_demo_assoc_qt_params()
  assoc_qt_params$data <- convert_plink_text_data_to_plink2_bin_data(
    assoc_qt_params$data
  )
  check_plink2_bin_data(assoc_qt_params$data)

  if (1 == 2) {
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

  stop("HIERO")
  "test_v1_7_after_make-bed_after_make-pgen"
  "toy_v1_9_after_make-bed_after_make-pgen.psam"

  assoc_qt_params$data <- list(
    pgen_filename = "~/assoc_qt_on_plink2_bin_files.pgen",
    psam_filename = "~/assoc_qt_on_plink2_bin_files.psam",
    pvar_filename = "~/assoc_qt_on_plink2_bin_files.pvar",
    phe_filename = "~/assoc_qt_on_plink2_bin_files.phe"
  )
  assoc_qt_params$phe_table <- NULL
  assoc_qt_filenames <- assoc_qt_on_plink2_bin_files(
    assoc_qt_params = assoc_qt_params
  )
  suppressMessages(
    expect_message(
      assoc_qt(
        assoc_qt_params = assoc_qt_params,
        plink_options = create_plink_v2_0_options(),
        verbose = TRUE
      ),
      "PLINK"
    )
  )

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})
