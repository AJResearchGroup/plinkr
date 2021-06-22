test_that("use", {
  expect_equal(get_os(), rappdirs::app_dir()$os)
})

test_that("tests clean up temp files", {
  expect_silent(check_empty_plinkr_folder())
})
