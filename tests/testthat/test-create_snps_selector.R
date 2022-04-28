test_that("use", {
  expect_silent(
    check_snp_selector(create_snps_selector(create_test_chromosome_selector()))
  )
  expect_silent(
    check_snp_selector(create_snps_selector(create_test_random_snps_selector()))
  )
  expect_silent(
    check_snp_selector(create_snps_selector(create_test_single_snp_selector()))
  )
  expect_silent(
    check_snp_selector(create_snps_selector(create_test_snp_range_selector()))
  )
  expect_silent(
    check_snp_selector(create_snps_selector(create_test_snp_window_selector()))
  )
})
