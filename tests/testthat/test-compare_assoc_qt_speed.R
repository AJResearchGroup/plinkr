test_that("Compare assoc_qt results and speed of PLINKs", {
  expect_equal(1 + 1, 2) # To prevent 'No test' warning

  if (!is_plink_installed()) return()

  # Goal is to see the results of the PLINK versions
  set.seed(314)
  t <- NA
  expect_message(
    t <- compare_assoc_qt_speed(
      n_individuals = 5,
      n_phenotypes = 4,
      n_snps_per_phenotype = 3,
      verbose = TRUE
    ),
    "simulating data"
  )

  t
  knitr::kable(t)


# t <- compare_assoc_qt_speed(
# n_individuals = 1000,
# n_phenotypes = 100,
# n_snps_per_phenotype = 10,
# verbose = TRUE                                                                # nolint
# )
# t
# |data_type               |plink_version | time_sec|
# |:-----------------------|:-------------|--------:|
# |PLINK text filenames    |1.7           | 5.594055|
# |PLINK text filenames    |1.9           | 1.449319|
# |PLINK text filenames    |2.0           |       NA|
# |PLINK binary filenames  |1.7           | 5.391561|
# |PLINK binary filenames  |1.9           | 1.490560|
# |PLINK binary filenames  |2.0           |       NA|
# |PLINK2 binary filenames |1.7           |       NA|
# |PLINK2 binary filenames |1.9           |       NA|
# |PLINK2 binary filenames |2.0           | 1.517090|

# t <- compare_assoc_qt_speed(
#   n_individuals = 1000,
#   n_phenotypes = 100,
#   n_snps_per_phenotype = 100,
#   verbose = TRUE                                                              # nolint
# )
# |data_type               |plink_version |  time_sec|
# |:-----------------------|:-------------|---------:|
# |PLINK text filenames    |1.7           | 29.333480|
# |PLINK text filenames    |1.9           |  4.312486|
# |PLINK text filenames    |2.0           |        NA|
# |PLINK binary filenames  |1.7           | 24.674025|
# |PLINK binary filenames  |1.9           |  4.133225|
# |PLINK binary filenames  |2.0           |        NA|
# |PLINK2 binary filenames |1.7           |        NA|
# |PLINK2 binary filenames |1.9           |        NA|
# |PLINK2 binary filenames |2.0           |  2.150578|

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})
