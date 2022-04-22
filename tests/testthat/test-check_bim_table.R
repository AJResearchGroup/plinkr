test_that("use", {
  expect_silent(check_bim_table(get_test_bim_table()))
  expect_silent(
    check_bim_table(
      bim_table = read_plink_bim_file(get_plinkr_filename("toy_data.bim"))
    )
  )

  expect_silent(check_empty_plinkr_folder())
  clear_plinkr_cache()
})
