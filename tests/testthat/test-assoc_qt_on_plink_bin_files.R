test_that("use", {

  if (!is_plink_installed()) return()

  clear_plinkr_cache()
  assoc_qt_data <- create_assoc_qt_data(
    data = create_plink_bin_filenames(
      bed_filename = get_plinkr_filename("demo_assoc_qt.bed"),
      bim_filename = get_plinkr_filename("demo_assoc_qt.bim"),
      fam_filename = get_plinkr_filename("demo_assoc_qt.fam")
    ),
    phenotype_data = create_phenotype_data_filename(
      phe_filename = get_plinkr_filename("demo_assoc_qt.phe")
    )
  )
  assoc_qt_params <- create_assoc_qt_params()
  assoc_qt_result_filenames <- assoc_qt_on_plink_bin_files(
    assoc_qt_data = assoc_qt_data,
    assoc_qt_params = assoc_qt_params
  )

  file.remove(assoc_qt_result_filenames$qassoc_filenames)
  file.remove(assoc_qt_result_filenames$log_filename)
  unlink(dirname(assoc_qt_params$base_input_filename), recursive = TRUE)
  unlink(dirname(assoc_qt_params$base_output_filename), recursive = TRUE)
  expect_silent(check_empty_plinkr_folder())

})
