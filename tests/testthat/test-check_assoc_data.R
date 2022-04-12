test_that("test", {
  assoc_data <- create_test_assoc_data()
  expect_silent(check_assoc_data(assoc_data))
})

test_that("demo", {
  assoc_data <- create_demo_assoc_data()
  expect_silent(check_assoc_data(assoc_data))
})

test_that("case_contol_codes must be 0s, 1s and 2s", {
  assoc_data <- create_demo_assoc_data()
  assoc_data$data$ped_table$case_control_code <- runif(
    nrow(assoc_data$data$ped_table)
  )
  expect_error(
    check_assoc_data(assoc_data),
    "'case_contol_codes' must be 1s and 2s"
  )
})
