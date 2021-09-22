test_that("minimal use", {
  expect_silent(create_test_assoc_qt_params())
})

test_that("use PLINK1 text data", {
  assoc_qt_params <- create_test_assoc_qt_params(
    data = create_test_plink_text_data()
  )
  expect_silent(check_assoc_qt_params(assoc_qt_params))
})

test_that("use PLINK1 bin data", {
  assoc_qt_params <- create_test_assoc_qt_params(
    data = create_test_plink_bin_data()
  )
  expect_silent(check_assoc_qt_params(assoc_qt_params))
})

test_that("use PLINK2 bin data", {
  skip("No PLINK2 bin data yet")
  assoc_qt_params <- create_test_assoc_qt_params(
    data = create_test_plink2_bin_data()
  )
  expect_silent(check_assoc_qt_params(assoc_qt_params))
})
