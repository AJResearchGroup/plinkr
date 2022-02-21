test_that("use", {
  expect_silent(check_sample_ids_filename("sample_ids.txt"))
  expect_silent(check_sample_ids_filename("/folder/sample_ids.txt"))
  expect_silent(check_sample_ids_filename("~/sample_ids.txt"))
  expect_error(check_sample_ids_filename(c("sample_ids.txt", "sample_ids.txt")))
  expect_silent(check_sample_ids_filename("sample_ids"))
  expect_error(check_sample_ids_filename(""))
  expect_error(check_sample_ids_filename("."))
})
