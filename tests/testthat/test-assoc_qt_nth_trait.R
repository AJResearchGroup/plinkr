test_that("use", {
  if (!is_plink_installed()) return()
  assoc_qt_params <- get_test_assoc_qt_params()
  expect_silent(
    assoc_qt_nth_trait(
      assoc_qt_params = assoc_qt_params,
      n = 1
    )
  )
  expect_error(
    assoc_qt_nth_trait(
      assoc_qt_params = assoc_qt_params,
      n = 2
    ),
    "Cannot associate the nth trait, as it is absent"
  )
})

test_that("for one trait, must match assoc_qt", {
  if (!is_plink_installed()) return()
  assoc_qt_params <- get_test_assoc_qt_params()
  assoc_qt_result_all <- assoc_qt(assoc_qt_params = assoc_qt_params)
  assoc_qt_result_nth <- assoc_qt_nth_trait(
    assoc_qt_params = assoc_qt_params,
    n = 1
  )
  expect_identical(assoc_qt_result_all, assoc_qt_result_nth)
})
