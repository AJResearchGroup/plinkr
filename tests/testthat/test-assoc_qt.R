test_that("minimal use, using PLINK1 text data", {
  expect_silent(check_empty_plinkr_folder())

  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_qt_params <- create_test_assoc_qt_params(
    data = create_test_plink_text_data()
  )
  assoc_qt(assoc_qt_params = assoc_qt_params)
  suppressMessages(
    expect_message(
      assoc_qt(
        assoc_qt_params = assoc_qt_params,
        verbose = TRUE
      ),
      "PLINK"
    )
  )

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})

test_that("minimal use, using PLINK1 binary data", {
  skip("Coersions")
  expect_silent(check_empty_plinkr_folder())

  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_qt_params <- create_test_assoc_qt_params(
    data = create_test_plink_bin_data()
  )
  assoc_qt(assoc_qt_params = assoc_qt_params)
  suppressMessages(
    expect_message(
      assoc_qt(
        assoc_qt_params = assoc_qt_params,
        verbose = TRUE
      ),
      "PLINK"
    )
  )

  expect_silent(check_empty_plinkr_folder())
})


test_that("minimal use, using PLINK1 binary data", {
  skip("Issue 16. Issue #16. Do assoc_qt using PLINK1 binary data")
  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_qt_params_as_text_data <- create_test_assoc_qt_params()
  expect_true(is_plink_text_data(assoc_qt_params_as_text_data$data))

  assoc_qt_params_as_bin_data <- assoc_qt_params_as_text_data
  assoc_qt_params_as_bin_data$data <- convert_plink_text_data_to_plink_bin_data(
    assoc_qt_params_as_text_data$data
  )
  expect_true(is_plink_bin_data(assoc_qt_params_as_bin_data$data))

  expect_silent(
    assoc_qt(
      assoc_qt_params = assoc_qt_params_as_bin_data
    )
  )
  suppressMessages(
    expect_message(
      assoc_qt(
        assoc_qt_params = assoc_qt_params,
        verbose = TRUE
      ),
      "PLINK"
    )
  )

  expect_silent(check_empty_plinkr_folder())
})
