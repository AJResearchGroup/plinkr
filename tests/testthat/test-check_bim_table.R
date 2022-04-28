test_that("use", {
  clear_plinkr_cache()

  expect_silent(check_bim_table(get_test_bim_table()))
  expect_silent(
    check_bim_table(
      bim_table = read_plink_bim_file(get_plinkr_filename("toy_data.bim"))
    )
  )

  expect_silent(check_empty_plinkr_folder())
})

test_that("use", {
  bim_table <- get_test_bim_table()
  names(bim_table)[5] <- "not_alt"
  expect_error(
    check_bim_table(bim_table),
    "The fifth column name of a .bim table must be 'alt'"
  )
})
