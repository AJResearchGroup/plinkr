test_that("use", {
  assoc_qt_data <- create_assoc_qt_data(
    data = create_plink_bin_filenames(
      bed_filename = get_plinkr_filename("select_snps.bed"),
      bim_filename = get_plinkr_filename("select_snps.bim"),
      fam_filename = get_plinkr_filename("select_snps.fam")
    ),
    phenotype_data = create_test_phenotype_data_filename(
      phe_filename = get_plinkr_filename("select_snps.phe")
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
