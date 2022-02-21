test_that("use PLINK1", {
  skip("WIP")
  phe_table <- get_test_phe_table()
  get_sample_ids_from_phe_table(phe_table)
  keep(plink_filenames = create_test_plink_text_filenames()) # nolint ignore

  expect_silent(check_empty_plinkr_folder())
})

test_that("use PLINK2", {
  skip("WIP")
  psam_table <- get_test_psam_table()
  sample_ids <- psam_table[, 1:2]

  expect_silent(check_empty_plinkr_folder())
})
