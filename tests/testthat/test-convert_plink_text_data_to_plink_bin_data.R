test_that("use", {
  if (!is_plink_installed(plink_options = create_plink_v1_9_options())) return()
  set.seed(314)
  plink_text_data <- create_test_assoc_qt_params()
  expect_true(is_plink_text_data(plink_text_data))
  plink_bin_data <- convert_plink_text_data_to_plink_bin_data(
    plink_text_data
  )
  expect_true(is_plink_bin_data(plink_bin_data))
})
