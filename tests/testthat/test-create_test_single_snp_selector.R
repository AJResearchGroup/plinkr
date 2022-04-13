test_that("use", {
  single_snp_selector <- create_test_single_snp_selector()
  expect_silent(
    check_single_snp_selector(single_snp_selector = single_snp_selector)
  )
  expect_true(
    is_single_snp_selector(single_snp_selector = single_snp_selector)
  )
})
