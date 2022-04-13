test_that("use on phenotype file without a header", {
  phenotypes <- read_plink_phe_file(
    phe_filename = get_plinkr_filename("pheno.raw")
  )
  # Standard PLINK names
  expect_true("FID" %in% names(phenotypes))
  expect_true("IID" %in% names(phenotypes))
  expect_true("P1" %in% names(phenotypes))
  expect_equal(6, nrow(phenotypes))
})

test_that("use on phenotype file with standard header", {
  phenotypes <- read_plink_phe_file(
    phe_filename = get_plinkr_filename("pheno_with_standard_header.phe")
  )
  # Standard PLINK names
  expect_true("FID" %in% names(phenotypes))
  expect_true("IID" %in% names(phenotypes))
  expect_true("P1" %in% names(phenotypes))
  expect_equal(6, nrow(phenotypes))
})

test_that("use on phenotype file with custom header", {
  phenotypes <- read_plink_phe_file(
    phe_filename = get_plinkr_filename("pheno_with_custom_header.phe")
  )
  expect_true("FID" %in% names(phenotypes))
  expect_true("IID" %in% names(phenotypes))
  expect_true("my_trait" %in% names(phenotypes))
  expect_equal(6, nrow(phenotypes))
})

test_that("multiple traits", {
  phe_table <- read_plink_phe_file(
    phe_filename = get_plinkr_filename("pheno.raw")
  )
  phe_table$phenotype_2 <- stats::runif(nrow(phe_table))
  phe_filename <- get_plinkr_tempfilename(fileext = ".phe")
  save_phe_table(
    phe_table = phe_table,
    phe_filename = phe_filename
  )

  phenotypes <- read_plink_phe_file(
    phe_filename = phe_filename
  )

  # The column names FID and IID match the PLINK names of the same
  # data in the phenotype files,
  # https://www.cog-genomics.org/plink/1.9/input#pheno
  expect_true("FID" %in% names(phenotypes))
  expect_true("IID" %in% names(phenotypes))
  expect_true("P1" %in% names(phenotypes))
  expect_true("phenotype_2" %in% names(phenotypes))
  expect_equal(6, nrow(phenotypes))
  file.remove(phe_filename)

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()

})

test_that("read PLINK tutorial file pop.phe", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_plink_tutorial_data_installed()) return()
  phe_filename <- stringr::str_subset(
    get_plink_tutorial_data_filenames(), "pop.phe"
  )
  expect_silent(read_plink_phe_file(phe_filename))
})

test_that("read PLINK tutorial file qt.phe", {
  expect_equal(1 + 1, 2) # Prevents testthat warning for empty test
  if (!is_plink_tutorial_data_installed()) return()
  phe_filename <- stringr::str_subset(
    get_plink_tutorial_data_filenames(), "qt.phe"
  )
  expect_silent(read_plink_phe_file(phe_filename))
})

test_that("add NAs", {
  phe_table <- get_test_phe_table()
  phe_table$P1[2] <- NA
  phe_filename <- get_plinkr_tempfilename(fileext = ".phe")
  save_phe_table(
    phe_table = phe_table,
    phe_filename = phe_filename
  )
  phe_table_again <- read_plink_phe_file(
    phe_filename = phe_filename
  )
  expect_identical(phe_table, phe_table_again)
  file.remove(phe_filename)
})
