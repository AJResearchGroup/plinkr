test_that("use", {
  assoc_qt_data <- create_demo_assoc_qt_data()

  # PLINK text data
  expect_true(is_plink_text_data(assoc_qt_data$data))
  minor_allele_frequences <- get_minor_alelle_frequencies(
    data = assoc_qt_data$data
  )

  # PLINK binary data
  assoc_qt_data$data <- convert_plink_text_data_to_plink_bin_data(
    assoc_qt_data$data
  )
  expect_true(is_plink_bin_data(assoc_qt_data$data))
  minor_allele_frequences <- get_minor_alelle_frequencies(
    data = assoc_qt_data$data
  )
})
