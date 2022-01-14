test_that("use", {
  expect_true(is_plink_bin_filenames(create_test_plink_bin_filenames()))
  expect_false(is_plink_bin_filenames("nonsense"))
  expect_message(is_plink_bin_filenames("nonsense", verbose = TRUE))
})
