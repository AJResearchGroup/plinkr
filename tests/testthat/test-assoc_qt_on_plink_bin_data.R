test_that("minimal use, from files", {
  if (!is_plink_installed()) return()

  clear_plinkr_cache()

  data <- convert_plink_text_data_to_plink_bin_data(
    plink_text_data = create_test_plink_text_data()
  )
  assoc_qt_data <- create_test_assoc_qt_data(
    data = data,
    phenotype_data = create_phenotype_data_table_from_data(data)
  )
  assoc_qt_on_plink_bin_data(
    assoc_qt_data = assoc_qt_data,
    assoc_qt_params = create_test_assoc_qt_params()
  )
  suppressMessages(
    expect_message(
      assoc_qt_on_plink_bin_data(
        assoc_qt_data = assoc_qt_data,
        assoc_qt_params = create_test_assoc_qt_params(),
        verbose = TRUE
      ),
      "you should be able to copy paste this"
    )
  )

  expect_silent(check_empty_plinkr_folder())
})

test_that("minimal use, simulated data", {
  if (!is_on_ci()) return()
  if (!is_plink_installed()) return()

  clear_plinkr_cache()

  set.seed(314)
  assoc_qt_data <- create_test_assoc_qt_data()
  assoc_qt_data$data <- convert_plink_text_data_to_plink_bin_data(
    assoc_qt_data$data
  )
  expect_true(is_plink_bin_data(assoc_qt_data$data))

  assoc_qt_on_plink_bin_data(
    assoc_qt_data = assoc_qt_data,
    assoc_qt_params = create_test_assoc_qt_params()
  )
  suppressMessages(
    expect_message(
      assoc_qt(
        assoc_qt_data = assoc_qt_data,
        assoc_qt_params = create_test_assoc_qt_params(),
        verbose = TRUE
      ),
      "you should be able to copy paste this"
    )
  )
  expect_silent(check_empty_plinkr_folder())
})

test_that("minimal use, simulated data, matches PLINK1 text data results", {
  if (!is_on_ci()) return()
  if (!is_plink_installed()) return()

  clear_plinkr_cache()

  set.seed(314)
  assoc_qt_data <- create_test_assoc_qt_data()
  assoc_qt_results_text <- assoc_qt_on_plink_text_data(
    assoc_qt_data = assoc_qt_data,
    assoc_qt_params = create_test_assoc_qt_params()
  )

  assoc_qt_data$data <- convert_plink_text_data_to_plink_bin_data(
    assoc_qt_data$data
  )
  assoc_qt_results_bin <- assoc_qt_on_plink_bin_data(
    assoc_qt_data = assoc_qt_data,
    assoc_qt_params = create_test_assoc_qt_params()
  )

  expect_identical(
    assoc_qt_results_text$qassoc_table,
    assoc_qt_results_bin$qassoc_table
  )

  expect_silent(check_empty_plinkr_folder())
})

test_that("use incorrect data", {
  if (!is_on_ci()) return()
  if (!is_plink_installed()) return()

  clear_plinkr_cache()

  set.seed(314)
  assoc_qt_data <- create_test_assoc_qt_data()
  expect_false(is_plink_bin_data(assoc_qt_data$data))
  expect_error(
    assoc_qt_on_plink_bin_data(
      assoc_qt_data = assoc_qt_data,
      assoc_qt_params = create_test_assoc_qt_params()
    ),
    "'assoc_qt_data' is not PLINK binary data"
  )
  expect_silent(check_empty_plinkr_folder())
})
