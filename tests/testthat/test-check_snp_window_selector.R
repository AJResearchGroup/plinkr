test_that("use", {
  snp_window_selector <- create_test_snp_window_selector()
  expect_silent(check_snp_window_selector(snp_window_selector))
  expect_error(check_snp_window_selector("nonsense"))
  expect_error(check_snp_window_selector(""))
  expect_error(check_snp_window_selector(list()))
  expect_error(check_snp_window_selector(c()))
  expect_error(check_snp_window_selector(NA))
  expect_error(check_snp_window_selector(NULL))
  expect_error(check_snp_window_selector(Inf))
  expect_error(check_snp_window_selector(42))
  expect_error(check_snp_window_selector(3.14))

})
