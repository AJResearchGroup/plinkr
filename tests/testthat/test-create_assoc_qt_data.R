test_that("minimal use", {
  check_assoc_qt_data(create_test_assoc_qt_data())
})

test_that("use files", {

  # The files
  pgen_filename <- get_plinkr_filename("assoc_qt_on_plink2_bin_files.pgen")
  psam_filename <- get_plinkr_filename("assoc_qt_on_plink2_bin_files.psam")
  pvar_filename <- get_plinkr_filename("assoc_qt_on_plink2_bin_files.pvar")
  phe_filename <- get_plinkr_filename("assoc_qt_on_plink2_bin_files.phe")

  # Pack into data
  data <- create_plink2_bin_filenames(
    pgen_filename = pgen_filename,
    psam_filename = psam_filename,
    pvar_filename = pvar_filename
  )
  phenotype_data <- create_phenotype_data_filename(
    phe_filename = phe_filename
  )
  assoc_qt_data <- create_assoc_qt_data(
    data = data,
    phenotype_data = phenotype_data
  )
  check_assoc_qt_data(assoc_qt_data)
})

test_that("use different types of (randomly picked) data", {
  check_assoc_qt_data(
    create_assoc_qt_data(
      data = create_test_plink_bin_data(),
      phenotype_data = create_test_phenotype_data_filename()
    )
  )
  check_assoc_qt_data(
    create_assoc_qt_data(
      data = create_test_plink2_bin_data(),
      phenotype_data = create_test_phenotype_data_filename()
    )
  )
})

test_that("use both two types of phenotype data", {
  check_assoc_qt_data(
    create_assoc_qt_data(
      data = create_test_plink_text_data(),
     phenotype_data = create_test_phenotype_data_table()
    )
  )
  check_assoc_qt_data(
    create_assoc_qt_data(
      data = create_test_plink_text_data(),
      phenotype_data = create_test_phenotype_data_filename()
    )
  )
})

test_that("convert", {
  if (!is_plink_installed()) return()

  # PLINK text
  assoc_qt_data <- create_test_assoc_qt_data()
  expect_true(is_plink_text_data(assoc_qt_data$data))
  check_assoc_qt_data(assoc_qt_data)

  # PLINK binary
  assoc_qt_data$data <- convert_plink_text_data_to_plink_bin_data(
    assoc_qt_data$data
  )
  expect_true(is_plink_bin_data(assoc_qt_data$data))
  check_assoc_qt_data(assoc_qt_data)

  # PLINK2 binary
  assoc_qt_data$data <- convert_plink_bin_data_to_plink2_bin_data(
    assoc_qt_data$data
  )
  expect_true(is_plink2_bin_data(assoc_qt_data$data))
  check_assoc_qt_data(assoc_qt_data)

  # PLINK text
  skip("Need 'convert_plink2_bin_data_to_plink_text_data'")
  assoc_qt_data$data <- convert_plink2_bin_data_to_plink_text_data(
    assoc_qt_data$data
  )
  expect_true(is_plink2_bin_data(assoc_qt_data$data))
  check_assoc_qt_data(assoc_qt_data)

})
