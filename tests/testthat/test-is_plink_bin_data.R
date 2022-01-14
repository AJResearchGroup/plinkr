test_that("use", {
  expect_true(is_plink_bin_data(create_test_plink_bin_data()))
  expect_false(is_plink_bin_data("nonsense"))
  expect_message(is_plink_bin_data("nonsense", verbose = TRUE))
})
