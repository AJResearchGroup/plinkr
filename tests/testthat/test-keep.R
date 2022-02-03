test_that("use PLINK1", {
  skip("WIP")
  phe_table <- get_test_phe_table()
  sample_ids <- phe_table[, 1:2]
  keep(plink_filenames = create_test_plink_text_filenames()) # nolint ignore
})

test_that("use PLINK2", {
  skip("WIP")
  psam_table <- get_test_psam_table()
  sample_ids <- psam_table[, 1:2]
})
