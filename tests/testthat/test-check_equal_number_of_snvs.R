test_that("use, create_test_assoc_qt_params, PLINK text", {
  set.seed(314)
  expect_silent(
    check_equal_number_of_snvs(
      assoc_qt_params = create_test_assoc_qt_params()
    )
  )
  expect_silent(check_empty_plinkr_folder())
})

test_that("use, create_test_assoc_qt_params, PLINK binary data", {
  set.seed(314)
  expect_silent(
    check_equal_number_of_snvs(
      assoc_qt_params = create_test_assoc_qt_params(
        data = create_test_plink_bin_data()
      )
    )
  )
  expect_silent(check_empty_plinkr_folder())
})

test_that("use, create_test_assoc_qt_params, PLINK2 binary data", {
  skip("'create_test_plink2_bin_data' not yet implemented")
  set.seed(314)
  expect_silent(
    check_equal_number_of_snvs(
      assoc_qt_params = create_test_assoc_qt_params(
        data = create_test_plink2_bin_data()
      )
    )
  )
  expect_silent(check_empty_plinkr_folder())
})

test_that("use, create_demo_assoc_qt_params", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  skip("Fail on Codecov")
  set.seed(314)
  expect_silent(
    check_equal_number_of_snvs(
      assoc_qt_params = create_demo_assoc_qt_params()
    )
  )
})

test_that("detect mismatch", {
  assoc_qt_params <- create_demo_assoc_qt_params()
  # Creates two SNVs
  assoc_qt_params$ped_table <- create_demo_ped_table(
    traits = rep(list(create_random_trait()), 2)
  )
  assoc_qt_params$map_table <- create_demo_map_table(
    traits = create_random_trait() # 1
  )
  expect_error(
    check_equal_number_of_snvs(
      assoc_qt_params = assoc_qt_params
    ),
    "ped.*2"
  )
  expect_error(
    check_equal_number_of_snvs(
      assoc_qt_params = assoc_qt_params
    ),
    "map.*1"
  )

  expect_silent(check_empty_plinkr_folder())
})
