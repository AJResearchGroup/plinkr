test_that("use", {
  expect_true(
    is_single_snp_selector(
      single_snp_selector = create_test_single_snp_selector()
    )
  )
  expect_false(
    is_single_snp_selector(
      single_snp_selector = create_test_random_snp_selector()
    )
  )
  expect_false(
    is_single_snp_selector(
      single_snp_selector = create_test_snp_range_selector()
    )
  )
  expect_false(
    is_single_snp_selector(
      single_snp_selector = create_test_snp_window_selector()
    )
  )
})
