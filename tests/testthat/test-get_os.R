test_that("use", {
  expect_equal(get_os(), rappdirs::app_dir()$os)
})
