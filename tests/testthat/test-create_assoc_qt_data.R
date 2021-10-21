test_that("use", {
  skip("assoc_qt_data")
  check_assoc_qt_data(create_test_assoc_qt_data())
  check_assoc_qt_data(create_demo_assoc_qt_data())

  assoc_qt_data <- create_assoc_qt_data(
    data = create_test_plink_bin_data(),
    phenotype_data = create_test_phenotype_data_table()
  )
  check_assoc_qt_data(assoc_qt_data)

  assoc_qt_data <- create_assoc_qt_data(
    data = create_test_plink2_bin_data(),
    phenotype_data = create_test_phenotype_data_filename()
  )
  check_assoc_qt_data(assoc_qt_data)

  data <- create_test_plink_text_data()
  assoc_qt_data <- create_assoc_qt_data(
    data = data,
    phenotype_data = create_phenotype_data_table_from_data(data = data)
  )
  check_assoc_qt_data(assoc_qt_data)
})
