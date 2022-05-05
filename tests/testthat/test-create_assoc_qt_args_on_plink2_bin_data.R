test_that("use", {
  clear_plinkr_cache()

  if (!is_plink_installed()) return()
  assoc_qt_data <- create_test_assoc_qt_data()
  assoc_qt_data$data <- convert_plink_text_data_to_plink2_bin_data(
    assoc_qt_data$data
  )
  args <- create_assoc_qt_args_on_plink2_bin_data(
    assoc_qt_data = assoc_qt_data,
    assoc_qt_params = create_test_assoc_qt_params(confidence_interval = 0.95),
    plink_options = create_plink_v2_0_options()
  )
  expect_true("--ci" %in% args)
  expect_silent(check_empty_plinkr_folder())
})
