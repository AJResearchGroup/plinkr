test_that("use", {
  pgen_table <- get_test_pgen_table()
  bed_table <- convert_pgen_table_to_bed_table(
    pgen_table = pgen_table
  )
  # .bed and .pgen tables are transposed,
  # see https://github.com/chrchang/plink-ng/issues/195
  expect_identical(pgen_table, t(bed_table))
})
