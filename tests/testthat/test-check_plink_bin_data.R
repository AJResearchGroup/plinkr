test_that("use", {
  expect_silent(check_plink_bin_data(create_test_plink_bin_data()))
  expect_error(check_plink_bin_data(NA), "list")
  expect_error(check_plink_bin_data(NULL), "list")
  expect_error(check_plink_bin_data("nonsense"), "list")
  expect_error(check_plink_bin_data(42), "list")
  expect_error(check_plink_bin_data(list()), "bim_table")
  expect_error(check_plink_bin_data(list(bim_table = "")), "fam_table")
})
