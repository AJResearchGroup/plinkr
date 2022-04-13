test_that("use", {
  expect_silent(create_test_random_snp_selector())
  expect_silent(
    check_random_snp_selector(
      create_test_random_snp_selector()
    )
  )
  expect_true(
    is_random_snp_selector(
      create_test_random_snp_selector()
    )
  )
})
