test_that("is silent", {
  expect_silent(create_test_assoc_params())
})

test_that("test", {
  assoc_params <- create_test_assoc_params()
  expect_silent(check_assoc_params(assoc_params))
})
