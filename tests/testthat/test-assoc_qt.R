test_that("use", {
  if (!is_plink_installed()) return()
  assoc_qt_params <- get_test_assoc_qt_params()
  expect_silent(
    assoc_qt(
      assoc_qt_params = assoc_qt_params
    )
  )
})
