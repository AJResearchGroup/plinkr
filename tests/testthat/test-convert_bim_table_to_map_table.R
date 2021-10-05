test_that("use", {

  bim_table <- get_test_bim_table()
  map_table <- convert_bim_table_to_map_table(
    bim_table = bim_table
  )
  expect_equal(map_table$CHR, bim_table$chr)
  expect_equal(map_table$SNP, bim_table$id)
  expect_equal(map_table$position_cm, bim_table$posg)
  expect_equal(map_table$BP, bim_table$pos)
})
