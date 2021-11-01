test_that("test data, PLINK2, PLINK2 bin files", {
  clear_plinkr_cache()
  expect_silent(check_empty_plinkr_folder())
  if (!is_plink_installed()) return()

  assoc_qt_data <- create_demo_assoc_qt_data()
  assoc_qt_data$data <- create_plink2_bin_filenames(
    pgen_filename = get_plinkr_filename("assoc_qt_on_plink2_bin_files.pgen"),
    psam_filename = get_plinkr_filename("assoc_qt_on_plink2_bin_files.psam"),
    pvar_filename = get_plinkr_filename("assoc_qt_on_plink2_bin_files.pvar")
  )
  assoc_qt_params <- create_test_assoc_params()
  assoc_qt_params$base_input_filename <- tools::file_path_sans_ext(
    get_plinkr_filename("assoc_qt_on_plink2_bin_files.phe")
  )
  # results are filenames here
  assoc_qt_result_filenames <- assoc_qt_on_plink2_bin_files(
    assoc_qt_data = assoc_qt_data,
    assoc_qt_params = assoc_qt_params
  )
  expect_true(all(file.exists(assoc_qt_result_filenames$qassoc_filenames)))
  expect_true(file.exists(assoc_qt_result_filenames$log_filename))
  file.remove(assoc_qt_result_filenames$qassoc_filenames)
  file.remove(assoc_qt_result_filenames$log_filename)
  expect_true(!all(file.exists(assoc_qt_result_filenames$qassoc_filenames)))
  expect_true(!file.exists(assoc_qt_result_filenames$log_filename))
  unlink(dirname(assoc_qt_params$base_output_filename), recursive = TRUE)
  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()

  suppressMessages(
    expect_message(
      assoc_qt_result_filenames <- assoc_qt_on_plink2_bin_files(
        assoc_qt_data = assoc_qt_data,
        assoc_qt_params = assoc_qt_params,
        plink_options = create_plink_v2_0_options(),
        verbose = TRUE
      ),
      "you should be able to copy paste this"
    )
  )
  expect_true(all(file.exists(assoc_qt_result_filenames$qassoc_filenames)))
  expect_true(file.exists(assoc_qt_result_filenames$log_filename))
  file.remove(assoc_qt_result_filenames$qassoc_filenames)
  file.remove(assoc_qt_result_filenames$log_filename)
  expect_true(!all(file.exists(assoc_qt_result_filenames$qassoc_filenames)))
  expect_true(!file.exists(assoc_qt_result_filenames$log_filename))
  unlink(dirname(assoc_qt_params$base_output_filename), recursive = TRUE)

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})
