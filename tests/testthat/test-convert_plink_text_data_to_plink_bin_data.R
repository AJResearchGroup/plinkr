test_that("use", {
  set.seed(314)
  plink_text_data <- create_test_assoc_qt_params()
  expect_true(is_plink_text_data(plink_text_data))
  assoc_qt_params_as_bin_data <- convert_plink_text_data_to_plink_bin_data(
    assoc_qt_params_as_text_data
  )
  expect_true(is_plink_bin_data(assoc_qt_params_as_bin_data))
})
