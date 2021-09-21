test_that("is silent", {
  expect_silent(create_test_assoc_params())
})

test_that("test", {
  assoc_params <- create_test_assoc_params()
  expect_silent(check_assoc_params(assoc_params))
})

test_that("demo", {
  assoc_params <- create_demo_assoc_params()
  expect_silent(check_assoc_params(assoc_params))
})

test_that("case_contol_codes must be 0s, 1s and 2s", {
  assoc_params <- create_demo_assoc_params()
  assoc_params$data$ped_table$case_control_code <- runif(
    nrow(assoc_params$data$ped_table)
  )
  expect_error(check_assoc_params(assoc_params))
})
