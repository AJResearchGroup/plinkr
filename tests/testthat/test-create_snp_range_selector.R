test_that("use", {
  snp_range_selector <- create_snp_range_selector(
    snp_from = "rs12345678",
    snp_to = "rs23456789"
  )
  expect_silent(check_snp_range_selector(snp_range_selector))
  expect_silent(check_snp_selector(snp_range_selector))
})
