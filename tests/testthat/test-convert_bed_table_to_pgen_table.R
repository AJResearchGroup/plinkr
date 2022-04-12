test_that("use", {
  bed_table <- get_test_bed_table()
  pgen_table <- convert_bed_table_to_pgen_table(
    bed_table = bed_table
  )
  # .bed and .pgen tables are transposed,
  # see https://github.com/chrchang/plink-ng/issues/195
  expect_identical(pgen_table, t(bed_table))
})

test_that("convert twice", {
  bed_table <- get_test_bed_table()
  pgen_table <- convert_bed_table_to_pgen_table(
    bed_table = bed_table
  )
  bed_table_again <- convert_pgen_table_to_bed_tabled_table(
    pgen_table = pgen_table
  )
  expect_identical(bed_table, bed_table_again)
})
