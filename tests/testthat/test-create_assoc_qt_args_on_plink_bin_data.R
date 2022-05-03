test_that("minimal use", {
  args <- create_assoc_qt_args_on_plink_bin_data(
    assoc_qt_data = create_test_assoc_qt_data(
      data = create_test_plink_bin_data()
    ),
    assoc_qt_params = create_test_assoc_qt_params()
  )
  expect_true("--ci" %in% args)
})

test_that("--allow-no-sex", {
  assoc_qt_data <- create_test_assoc_qt_data(
    data = create_test_plink_bin_data()
  )
  assoc_qt_params_false <- create_test_assoc_qt_params(allow_no_sex = FALSE)
  assoc_qt_params_true <- create_test_assoc_qt_params(allow_no_sex = TRUE)
  args_true <- create_assoc_qt_args_on_plink_bin_data(
    assoc_qt_data = assoc_qt_data,
    assoc_qt_params = assoc_qt_params_true
  )
  args_false <- create_assoc_qt_args_on_plink_bin_data(
    assoc_qt_data = assoc_qt_data,
    assoc_qt_params = assoc_qt_params_false
  )
  expect_true(length(args_true) != length(args_false))
})
