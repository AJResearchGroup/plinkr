test_that("is silent", {
  expect_silent(create_test_assoc_params())
})

test_that("valid", {
  assoc_params <- create_test_assoc_params()
  expect_silent(check_assoc_params(assoc_params))
})
