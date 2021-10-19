test_that("use", {
  skip("assoc_qt_data")
  check_assoc_qt_data(create_test_assoc_qt_data())
  check_assoc_qt_data(create_demo_assoc_qt_data())
  assoc_qt_data <- create_assoc_qt_data(
    data = create_plink2_bin_data(),
    phenotype_data = create_test_phenotype_data()
  )
  assoc_qt_data <- create_assoc_qt_data(
    data = create_plink2_bin_data(),
    phenotype_data = create_test_phenotype_filename()
  )
})
