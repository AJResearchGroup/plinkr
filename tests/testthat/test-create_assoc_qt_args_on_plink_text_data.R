test_that("use", {
  args <- create_assoc_qt_args_on_plink_text_data(
    assoc_qt_data = create_test_assoc_qt_data(
      data = create_test_plink_text_data()
    ),
    assoc_qt_params = create_test_assoc_qt_params(),
    plink_options = create_plink_v1_7_options()
  )
  args
  expect_silent(check_empty_plinkr_folder())
})
