test_that("use", {
  if (!is_plink_installed()) return()

  clear_plinkr_cache()
  assoc_qt_data <- create_assoc_qt_data(
    data = create_plink_text_filenames(
      map_filename = get_plinkr_filename("demo_assoc_qt.map"),
      ped_filename = get_plinkr_filename("demo_assoc_qt.ped")
    ),
    phenotype_data = create_phenotype_data_filename(
      phe_filename = get_plinkr_filename("demo_assoc_qt.phe")
    )
  )
  check_assoc_qt_data(assoc_qt_data)
  assoc_qt_params <- create_assoc_qt_params()
  assoc_qt_result_filenames <- assoc_qt_on_plink_text_files(
    assoc_qt_data = assoc_qt_data,
    assoc_qt_params = assoc_qt_params
  )
  expect_true(all(file.exists(unlist(assoc_qt_result_filenames))))
  unlink(dirname(assoc_qt_result_filenames$log_filename), recursive = TRUE)
  unlink(dirname(assoc_qt_params$base_input_filename), recursive = TRUE)
  unlink(dirname(assoc_qt_params$base_output_filename), recursive = TRUE)

  expect_silent(check_empty_plinkr_folder())
})
