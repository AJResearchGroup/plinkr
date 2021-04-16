test_that("use", {
  if (!is_plink_installed()) return()
  expect_silent(get_plink_version())
  text <- get_plink_version()
  expect_true(is.character(text))
  expect_true(length(text) == 1)
})
