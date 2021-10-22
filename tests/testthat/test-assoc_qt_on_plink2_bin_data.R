test_that("test data, PLINK2, PLINK2 bin data", {
  expect_silent(check_empty_plinkr_folder())

  if (!is_plink_installed()) return()
  assoc_qt_data <- create_demo_assoc_qt_data()
  assoc_qt_data$data <- convert_plink_text_data_to_plink2_bin_data(
    assoc_qt_data$data
  )
  check_plink2_bin_data(assoc_qt_data$data)

  assoc_qt_on_plink2_bin_data(
    assoc_qt_data = assoc_qt_data,
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
      "you should be able to copy paste this"
    )
  )

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})
