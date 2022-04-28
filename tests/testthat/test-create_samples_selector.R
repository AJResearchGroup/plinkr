test_that("use", {
  expect_silent(
    check_sample_selector(
      create_samples_selector(
        create_test_random_samples_selector()
      )
    )
  )
  expect_silent(
    check_sample_selector(
      create_samples_selector(
        create_test_single_sample_selector()
      )
    )
  )
})
