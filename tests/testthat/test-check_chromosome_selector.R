test_that("use", {
  chromosome_selector <- create_test_chromosome_selector()
  expect_silent(
    check_chromosome_selector(chromosome_selector = chromosome_selector)
  )
})
