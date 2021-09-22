test_that("use", {
  expect_silent(create_test_plink_bin_data())
})

test_that("must match PLINK1 text data", {

  skip("Phenotypes not copied?")
  # --pheno causes phenotype values to be read from the 3rd column
  # of the specified space- or tab-delimited file,
  # instead of the .fam or .ped file.
  # The first and second columns of that file must contain family
  # and within-family IDs, respectively.

  plink_text_data <- create_test_plink_text_data()

  plink_bin_data <- create_test_plink_bin_data()

  plink_text_data

  # Convert using PLINK
  plink_bin_data_again <- convert_plink_text_data_to_plink_bin_data(
    plink_text_data,
    plink_options = create_plink_v1_9_options()
  )
  expect_identical(plink_bin_data, plink_bin_data_again)
})
