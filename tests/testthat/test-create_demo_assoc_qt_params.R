test_that("use", {
  assoc_qt_params <- create_demo_assoc_qt_params()
  expect_silent(check_assoc_qt_params(assoc_qt_params))
})

test_that("use", {
  n_individuals <- 4
  assoc_qt_params <- create_demo_assoc_qt_params(
    n_individuals = 4
  )
  expect_silent(check_assoc_qt_params(assoc_qt_params))
  expect_equal(n_individuals, nrow(assoc_qt_params$ped_table))
  expect_equal(n_individuals, nrow(assoc_qt_params$phenotype_table))
})
