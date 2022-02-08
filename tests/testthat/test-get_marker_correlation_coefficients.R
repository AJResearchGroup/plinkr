test_that("random data, no LD", {
  set.seed(42)
  assoc_qt_data <- create_demo_assoc_qt_data(n_individuals = 100)
  assoc_qt_data$data$map_table$CHR <- 1

  # PLINK text data
  expect_true(is_plink_text_data(assoc_qt_data$data))
  marker_correlation_coefficients <- get_marker_correlation_coefficients(
    data = assoc_qt_data$data
  )
  marker_correlation_coefficients <- get_marker_correlation_coefficients(
    data = assoc_qt_data$data,
    ld_window_r2 = 0.2
  )

  # PLINK binary data
  assoc_qt_data$data <- convert_plink_text_data_to_plink_bin_data(
    assoc_qt_data$data
  )
  expect_true(is_plink_bin_data(assoc_qt_data$data))
  marker_correlation_coefficients <- get_marker_correlation_coefficients(
    data = assoc_qt_data$data
  )

})

test_that("use", {
  set.seed(42)
  n_individuals <- 1000
  assoc_qt_data <- create_demo_assoc_qt_data(n_individuals = n_individuals)
  assoc_qt_data$data$map_table$CHR <- 1
  snps_that_are_identical <- sample(
    seq(1, n_individuals), size = n_individuals / 2,
    replace = FALSE
  )
  assoc_qt_data$data$ped_table$snv_2a[snps_that_are_identical] <-
    assoc_qt_data$data$ped_table$snv_1a[snps_that_are_identical]
  assoc_qt_data$data$ped_table$snv_2b[snps_that_are_identical] <-
    assoc_qt_data$data$ped_table$snv_1b[snps_that_are_identical]

  # PLINK text data
  expect_true(is_plink_text_data(assoc_qt_data$data))
  marker_correlation_coefficients <- get_marker_correlation_coefficients(
    data = assoc_qt_data$data
  )

  # PLINK binary data
  assoc_qt_data$data <- convert_plink_text_data_to_plink_bin_data(
    assoc_qt_data$data
  )
  expect_true(is_plink_bin_data(assoc_qt_data$data))
  marker_correlation_coefficients <- get_marker_correlation_coefficients(
    data = assoc_qt_data$data
  )

})
