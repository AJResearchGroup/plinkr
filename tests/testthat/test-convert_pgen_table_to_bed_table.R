test_that("use", {
  pgen_table <- get_test_pgen_table()
  bed_table <- convert_pgen_table_to_bed_table(
    pgen_table = pgen_table
  )
  expect_equal(nrow(pgen_table), nrow(bed_table))
  expect_equal(ncol(pgen_table), ncol(bed_table))
  expect_identical(pgen_table, bed_table)
})

