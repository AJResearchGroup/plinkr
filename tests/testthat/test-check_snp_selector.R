test_that("use", {
  expect_silent(
    check_snp_selector(
      snp_selector = create_test_snp_window_selector()
    )
  )
  # Other types of SNP selectors

  expect_error(check_snp_selector("nonsense"))
  expect_error(check_snp_selector(""))
  expect_error(check_snp_selector(list()))
  expect_error(check_snp_selector(c()))
  expect_error(check_snp_selector(NA))
  expect_error(check_snp_selector(NULL))
  expect_error(check_snp_selector(Inf))
  expect_error(check_snp_selector(42))
  expect_error(check_snp_selector(3.14))

})
