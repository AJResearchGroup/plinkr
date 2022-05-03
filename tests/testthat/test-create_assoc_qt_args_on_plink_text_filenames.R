test_that("use", {
  assoc_qt_data <- create_assoc_qt_data(
    data = create_plink_text_filenames(
      map_filename = get_plinkr_filename("demo_assoc_qt.map"),
      ped_filename = get_plinkr_filename("demo_assoc_qt.ped")
    ),
    phenotype_data = create_test_phenotype_data_filename(
      phe_filename = get_plinkr_filename("demo_assoc_qt.phe")
    )
  )
  args <- create_assoc_qt_args_on_plink_text_filenames(
    assoc_qt_data = assoc_qt_data,
    assoc_qt_params = create_test_assoc_qt_params()
  )
  expect_true("--ci" %in% args)
})

test_that("--allow-no-sex", {
  assoc_qt_data <- create_assoc_qt_data(
    data = create_plink_text_filenames(
      map_filename = get_plinkr_filename("demo_assoc_qt.map"),
      ped_filename = get_plinkr_filename("demo_assoc_qt.ped")
    ),
    phenotype_data = create_test_phenotype_data_filename(
      phe_filename = get_plinkr_filename("demo_assoc_qt.phe")
    )
  )
  args_true <- create_assoc_qt_args_on_plink_bin_filenames(
    assoc_qt_data = assoc_qt_data,
    assoc_qt_params = create_test_assoc_qt_params(allow_no_sex = TRUE)
  )
  args_false <- create_assoc_qt_args_on_plink_bin_filenames(
    assoc_qt_data = assoc_qt_data,
    assoc_qt_params = create_test_assoc_qt_params(allow_no_sex = FALSE)
  )
  expect_true(length(args_true) != length(args_false))
})
