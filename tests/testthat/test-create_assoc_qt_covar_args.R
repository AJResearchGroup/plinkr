test_that("use, v1.7", {
  skip("No covariates yet")
  plink_options <- create_plink_v1_7_options()
  assoc_qt_covar_args <- create_assoc_qt_covar_args(
    assoc_qt_covar_params = create_test_assoc_qt_covar_params(),
    plink_options = plink_options
  )

  expect_silent(
    check_plink_args(
      args = assoc_qt_covar_args,
      plink_options = plink_options
    )
  )
  expect_equal(assoc_qt_covar_args[length(assoc_qt_covar_args) - 1], "--out")
})

test_that("use, v1.9", {
  skip("No covariates yet")
  assoc_qt_covar_args <- create_assoc_qt_covar_args(
    assoc_qt_covar_params = create_test_assoc_qt_covar_params(),
    plink_options = create_plink_v1_9_options()
  )
  expect_equal(assoc_qt_covar_args[length(assoc_qt_covar_args) - 1], "--out")
})

test_that("use, v2.0", {
  assoc_qt_covar_params <- create_test_assoc_qt_covar_params()
  assoc_qt_covar_params$data <- convert_plink_text_data_to_plink2_bin_data(
    assoc_qt_covar_params$data
  )
  assoc_qt_covar_args <- create_assoc_qt_covar_args(
    assoc_qt_covar_params = assoc_qt_covar_params,
    plink_options = create_plink_v2_0_options()
  )
  expect_equal(assoc_qt_covar_args[length(assoc_qt_covar_args) - 1], "--out")
})
