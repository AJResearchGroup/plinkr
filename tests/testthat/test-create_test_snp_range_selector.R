test_that("use", {
  snp_range_selector <- create_test_snp_range_selector()
  expect_silent(check_snp_range_selector(snp_range_selector))
  expect_silent(check_snp_selector(snp_range_selector))
})
