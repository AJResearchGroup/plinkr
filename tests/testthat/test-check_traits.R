test_that("use", {
  t <- create_random_trait()

  expect_silent(check_traits(t))
  expect_silent(check_traits(list(t, t)))
  expect_error(check_traits(list(t, "x")))
  expect_error(check_traits(c(t, t)))
  expect_error(check_traits("nonsense"))
  expect_error(check_traits(3.14))
  expect_error(check_traits(42))
  expect_error(check_traits(NULL))
  expect_error(check_traits(NA))
  expect_error(check_traits(Inf))
})
