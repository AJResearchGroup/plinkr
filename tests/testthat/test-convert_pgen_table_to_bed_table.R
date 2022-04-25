test_that("use", {
  pgen_table <- get_test_pgen_table()
  bed_table <- convert_pgen_table_to_bed_table(
    pgen_table = pgen_table
  )
  expect_true(has_bed_table_attributes(bed_table))
  expect_false(has_pgen_table_attributes(bed_table))
  # .bed and .pgen tables are transposed,
  # see https://github.com/chrchang/plink-ng/issues/195
  attributes(bed_table)$plinkr_datatype <- NULL
  attributes(pgen_table)$plinkr_datatype <- NULL
  expect_identical(pgen_table, t(bed_table))
})
