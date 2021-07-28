test_that("use", {
  expect_silent(get_test_bim_table())
})

test_that("same as toy_data.bim", {
  bim_table_1 <- plinkr::read_plink_bim_file(
    bim_filename = get_plinkr_filename("toy_data.bim")
  )
  bim_table_2 <- get_test_bim_table()
  expect_identical(bim_table_2, bim_table_1)
})
