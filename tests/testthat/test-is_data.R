test_that("use", {
  expect_true(is_data(create_test_plink_text_data()))
  expect_true(is_data(create_test_plink_bin_data()))
  expect_true(is_data(create_test_plink2_bin_data()))
  expect_true(is_data(create_test_plink_text_filenames()))
  expect_true(is_data(create_test_plink_bin_filenames()))
  expect_true(is_data(create_test_plink2_bin_filenames()))
  expect_false(is_data("nonsense"))
  expect_message(
    is_data("nonsense", verbose = TRUE),
    "'data' must be a list"
  )
})
