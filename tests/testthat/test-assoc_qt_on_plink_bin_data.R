test_that("minimal use, from files", {
  if (!is_plink_installed()) return()
  data <- convert_plink_text_data_to_plink_bin_data(
    create_test_plink_text_data()
  )
  assoc_qt_params <- create_test_assoc_qt_params(
    data = data,
    phe_table = create_phe_table_from_data(data)
  )
  expect_true(
    is_plink_bin_data(plink_bin_data = assoc_qt_params$data)
  )
  assoc_qt_on_plink_bin_data(
    assoc_qt_params = assoc_qt_params
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

test_that("minimal use, simulated data", {

  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_qt_params <- create_test_assoc_qt_params()
  assoc_qt_params$data <- convert_plink_text_data_to_plink_bin_data(
    assoc_qt_params$data
  )
  # assoc_qt_params$data$fam_table$pheno <- 9 # No measured phenotypes # nolint

  expect_true(is_plink_bin_data(assoc_qt_params$data))

  assoc_qt_on_plink_bin_data(
    assoc_qt_params = assoc_qt_params
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
  clear_plinkr_cache()
})

test_that("minimal use, simulated data, matches PLINK1 text data results", {

  if (!is_plink_installed()) return()
  set.seed(314)
  assoc_qt_params <- create_test_assoc_qt_params()
  assoc_qt_results_text <- assoc_qt_on_plink_text_data(
    assoc_qt_params = assoc_qt_params
  )

  assoc_qt_params$data <- convert_plink_text_data_to_plink_bin_data(
    assoc_qt_params$data
  )
  assoc_qt_results_bin <- assoc_qt_on_plink_bin_data(
    assoc_qt_params = assoc_qt_params
  )

  expect_identical(assoc_qt_results_text, assoc_qt_results_bin)

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})
