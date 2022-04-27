test_that("use", {
  expect_silent(
    create_random_samples_selector(
      n_samples = 1
    )
  )
})

test_that("use, will select zero samples, disallow", {
  expect_error(
    create_random_samples_selector(
      n_samples = 0
    ),
    "'random_samples_selector' must select at least 1 sample"
  )
})
