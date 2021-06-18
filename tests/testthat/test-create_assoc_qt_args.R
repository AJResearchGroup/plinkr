test_that("use, v1.7", {
  expect_silent(
    create_assoc_qt_args(
      assoc_qt_params = create_test_assoc_qt_params(),
      plink_options = create_plink_v1_7_options()
    )
  )
})

test_that("use, v1.9", {
  expect_silent(
    create_assoc_qt_args(
      assoc_qt_params = create_test_assoc_qt_params(),
      plink_options = create_plink_v1_9_options()
    )
  )
})

test_that("use, v2.0", {
  expect_silent(
    create_assoc_qt_args(
      assoc_qt_params = create_test_assoc_qt_params(),
      plink_options = create_plink_v2_0_options()
    )
  )
})
