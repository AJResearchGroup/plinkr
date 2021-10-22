test_that("use", {
  clear_plinkr_cache()

  assoc_qt_data <- create_test_assoc_qt_data()
  phe_filename <- get_plinkr_tempfilename(fileext = ".phe")
  expect_true(is_phenotype_data_table(assoc_qt_data$phenotype_data))
  assoc_qt_data$phenotype_data <- save_phenotype_data_table(
    phenotype_data_table = assoc_qt_data$phenotype_data,
    phe_filename = phe_filename
  )
  expect_true(is_phenotype_data_filename(assoc_qt_data$phenotype_data))
  file.remove(phe_filename)
  expect_silent(check_empty_plinkr_folder())
})
