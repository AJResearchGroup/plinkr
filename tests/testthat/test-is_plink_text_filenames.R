test_that("use", {
  expect_true(is_plink_text_filenames(create_test_plink_text_filenames()))
  expect_false(is_plink_text_filenames("nonsense", verbose = TRUE))
})
