test_that("use", {
  expect_silent(create_test_plink_text_filenames())
  expect_silent(check_plink_text_filenames(create_test_plink_text_filenames()))
})
