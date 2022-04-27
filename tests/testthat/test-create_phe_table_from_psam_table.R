test_that("use", {
  psam_table <- get_test_psam_table()
  phe_table <- create_phe_table_from_psam_table(psam_table)
  expect_identical(psam_table$FID, phe_table$FID)
  expect_identical(psam_table$IID, phe_table$IID)
  expect_true("P1" %in% names(phe_table))
})
