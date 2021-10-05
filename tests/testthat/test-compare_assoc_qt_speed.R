test_that("Compare assoc_qt results and speed of PLINKs", {
  expect_equal(1 + 1, 2) # To prevent 'No test' warning

  if (!is_plink_installed()) return()

  # Goal is to see the results of the PLINK versions
  set.seed(314)
  n_individuals <- 5
  n_phenotypes <- 3
  n_snps_per_phenotype <- 4
  assoc_qt_params <- create_demo_assoc_qt_params(
    n_individuals = n_individuals,
    traits = rep(
      list(create_random_trait(n_snps = n_snps_per_phenotype)),
      times = n_phenotypes
    )
  )
  assoc_qt_params$data$map_table$CHR <- 1 # nolint PLINK2 variable naming
  t <- compare_assoc_qt_speed(
    assoc_qt_params
  )
  t

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})
