test_that("use", {
  expect_silent(create_test_assoc_qt_params_with_plink_text_data())
  expect_true(
    is_plink_text_data(create_test_assoc_qt_params_with_plink_text_data())
  )
})
