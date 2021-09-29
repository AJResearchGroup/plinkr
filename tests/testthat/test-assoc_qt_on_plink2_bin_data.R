test_that("test data, PLINK2, PLINK2 bin data", {
  skip("Need 'save_pgen'. HERE. HIERO")

  expect_silent(check_empty_plinkr_folder())

  if (!is_plink_installed()) return()
  # assoc_qt_params <- create_test_assoc_qt_params(
  #   data = create_test_plink2_bin_data()
  # )
  assoc_qt_params <- create_demo_assoc_qt_params()
  assoc_qt_params$data <- convert_plink_text_data_to_plink2_bin_data(
    assoc_qt_params$data
  )
  check_plink2_bin_data(assoc_qt_params$data)

  assoc_qt_on_plink2_bin_data(
    assoc_qt_params = assoc_qt_params,
    plink_options = create_plink_v2_0_options()
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
