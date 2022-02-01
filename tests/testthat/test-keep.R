test_that("use PLINK1", {
  phe_table <- get_test_phe_table()
  sample_ids <- phe_table[, 1:2]

  keep(
    plink_filenames = create_test_plink_text_filenames()
  )
})

test_that("use PLINK2", {
  psam_table <- get_test_psam_table()
  sample_ids <- psam_table[, 1:2]
})
