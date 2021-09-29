test_that("use", {
  psam_table <- get_test_psam_table()
  fam_table <- convert_psam_table_to_fam_table(
    psam_table = psam_table
  )
  expect_silent(check_fam_table(fam_table))
  expect_equal(nrow(psam_table), nrow(fam_table))
  expect_equal(psam_table$FID, fam_table$fam)
  expect_equal(psam_table$IID, fam_table$id)
  expect_equal(psam_table$SEX, fam_table$sex)
  expect_equal(psam_table$PHENO1, fam_table$pheno)
  expect_true(all(0 == fam_table$pat))
  expect_true(all(0 == fam_table$mat))
})
