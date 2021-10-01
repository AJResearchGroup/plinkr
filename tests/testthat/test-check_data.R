test_that("use", {
  expect_silent(check_data(data = create_test_plink_text_data()))
  expect_silent(check_data(data = create_test_plink_bin_data()))
  expect_silent(check_data(data = create_test_plink2_bin_data()))
  expect_silent(check_data(data = create_test_plink_text_filenames()))
  expect_silent(check_data(data = create_test_plink_bin_filenames()))
  expect_silent(check_data(data = create_test_plink2_bin_filenames()))
})

test_that("abuse", {
  expect_error(check_data(data = "nonsense"), "'data' must be a list")
  expect_error(check_data(data = NA), "'data' must be a list")
  expect_error(check_data(data = NULL), "'data' must be a list")
  expect_error(check_data(data = Inf), "'data' must be a list")
  expect_error(check_data(data = ""), "'data' must be a list")
  expect_error(check_data(data = c()), "'data' must be a list")
  expect_error(check_data(data = c(1, 2)), "'data' must be a list")
  expect_error(
    check_data(data = list()),
    "Unknown data format"
  )
})
