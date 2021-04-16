test_that("use", {
  if (!is_plink_installed()) return()
  expect_silent(get_plink_help_text())

  text <- get_plink_help_text()
  expect_true(is.character(text))
  expect_true(length(text) > 50)
})
