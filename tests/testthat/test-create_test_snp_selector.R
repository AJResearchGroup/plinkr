test_that("use", {
  snp_snp_window_selector <- create_test_snp_window_selector()
  expect_silent(check_snp_window_selector(snp_snp_window_selector))
})
