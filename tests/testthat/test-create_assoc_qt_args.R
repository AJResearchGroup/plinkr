################################################################################
#
# * PLINK v1.7
#   * PLINK text data: OK
#   * PLINK bin data: OK
#   * PLINK2 bin data: must fail
# * PLINK v1.9
#   * PLINK text data: OK
#   * PLINK bin data: OK
#   * PLINK2 bin data: must fail
# * PLINK2 v2.0
#   * PLINK text data: must fail
#   * PLINK bin data: must fail
#   * PLINK2 bin data: OK
#
################################################################################

################################################################################
# PLINK v1.7
################################################################################
test_that("use, PLINK v1.7, PLINK text data", {

  expect_silent(
    args <- create_assoc_qt_args(
      assoc_qt_params = create_test_assoc_qt_params(),
      plink_options = create_plink_v1_7_options()
    )
  )
})

test_that("use, PLINK v1.7, PLINK bin data", {
  expect_silent(check_empty_plinkr_folder())

  if (!is_plink_installed()) return()

  assoc_qt_params <- create_test_assoc_qt_params()
  assoc_qt_params$data <- convert_plink_text_data_to_plink_bin_data(
    assoc_qt_params$data
  )
  expect_silent(
    create_assoc_qt_args(
      assoc_qt_params = assoc_qt_params,
      plink_options = create_plink_v1_7_options()
    )
  )
})

test_that("use, PLINK v1.7, PLINK2 bin data", {
  expect_silent(check_empty_plinkr_folder())

  if (!is_plink_installed()) return()
  assoc_qt_params <- create_test_assoc_qt_params()
  assoc_qt_params$data <- convert_plink_text_data_to_plink2_bin_data(
    assoc_qt_params$data
  )
  expect_error(
    create_assoc_qt_args(
      assoc_qt_params = assoc_qt_params,
      plink_options = create_plink_v1_7_options()
    ),
    "PLINK cannot work with PLINK2 binary data"
  )
})

################################################################################
# PLINK v1.9
################################################################################
test_that("use, PLINK v1.9, PLINK text data", {
  expect_silent(
    create_assoc_qt_args(
      assoc_qt_params = create_test_assoc_qt_params(),
      plink_options = create_plink_v1_9_options()
    )
  )
})

test_that("use, PLINK v1.9, PLINK bin data", {
  expect_silent(check_empty_plinkr_folder())

  if (!is_plink_installed()) return()
  assoc_qt_params <- create_test_assoc_qt_params()
  assoc_qt_params$data <- convert_plink_text_data_to_plink_bin_data(
    assoc_qt_params$data
  )
  expect_silent(
    create_assoc_qt_args(
      assoc_qt_params = assoc_qt_params,
      plink_options = create_plink_v1_9_options()
    )
  )
})

test_that("use, PLINK v1.9, PLINK2 bin data", {
  expect_silent(check_empty_plinkr_folder())

  if (!is_plink_installed()) return()
  assoc_qt_params <- create_test_assoc_qt_params()
  assoc_qt_params$data <- convert_plink_text_data_to_plink2_bin_data(
    assoc_qt_params$data
  )
  expect_error(
    create_assoc_qt_args(
      assoc_qt_params = assoc_qt_params,
      plink_options = create_plink_v1_9_options()
    ),
    "PLINK cannot work with PLINK2 binary data"
  )
})

################################################################################
# PLINK2
################################################################################
test_that("use, PLINK2, PLINK text data", {
  expect_silent(check_empty_plinkr_folder())

  if (!is_plink_installed()) return()
  assoc_qt_params <- create_test_assoc_qt_params()
  expect_true(is_plink_text_data(assoc_qt_params$data))
  expect_error(
    create_assoc_qt_args(
      assoc_qt_params,
      plink_options = create_plink_v2_0_options()
    ),
    "PLINK2 cannot work with PLINK text data"
  )
})

test_that("use, PLINK2, PLINK binary data", {
  expect_silent(check_empty_plinkr_folder())

  if (!is_plink_installed()) return()
  assoc_qt_params <- create_test_assoc_qt_params()
  assoc_qt_params$data <- convert_plink_text_data_to_plink_bin_data(
    assoc_qt_params$data
  )
  expect_error(
    create_assoc_qt_args(
      assoc_qt_params,
      plink_options = create_plink_v2_0_options()
    ),
    "PLINK2 cannot work with PLINK binary data"
  )
})

test_that("use, PLINK2, PLINK2 binary data", {
  expect_silent(check_empty_plinkr_folder())

  if (!is_plink_installed()) return()
  assoc_qt_params <- create_test_assoc_qt_params()
  assoc_qt_params$data <- convert_plink_text_data_to_plink2_bin_data(
    assoc_qt_params$data
  )
  expect_silent(
    create_assoc_qt_args(
      assoc_qt_params,
      plink_options = create_plink_v2_0_options()
    )
  )
})
