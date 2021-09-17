test_that("use", {
  expect_silent(check_bim_table(get_test_bim_table()))

  expect_silent(check_empty_plinkr_folder())
})
