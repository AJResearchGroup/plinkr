test_that("use", {
  expect_silent(
    check_equal_number_of_snvs(
      assoc_qt_params = create_test_assoc_qt_params()
    )
  )
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
    phenotypes = get_phenotypes()[1:2] # 2
  )
  assoc_qt_params$map_table <- create_demo_map_table(n_snps = 3)
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
    "map.*3"
  )
})
