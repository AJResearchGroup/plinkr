test_that("use", {
  single_snp_selector <- create_single_snp_selector(snp = "rs12345678")
  check_single_snp_selector(single_snp_selector = single_snp_selector)
  check_snp_selector(snp_selector = single_snp_selector)
})
