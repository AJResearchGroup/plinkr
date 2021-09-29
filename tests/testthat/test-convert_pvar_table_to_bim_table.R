test_that("use", {
  pvar_table <- get_test_pvar_table()
  bim_table <- convert_pvar_table_to_bim_table(
    pvar_table = pvar_table
  )
  expect_silent(check_bim_table(bim_table))
  expect_equal(nrow(pvar_table), nrow(bim_table))
  expect_equal(pvar_table$CHROM, bim_table$chr)
  expect_equal(pvar_table$POS, bim_table$pos)
  expect_equal(pvar_table$ID, bim_table$id)
  expect_equal(pvar_table$REF, bim_table$ref)
  expect_equal(pvar_table$ALT, bim_table$alt)
  expect_true(all(0 == bim_table$posg))
})
