test_that("use", {
  if (!is_plink_installed()) return()
  expect_silent(get_plink_help_text())

  text <- get_plink_help_text()
  expect_true(is.character(text))
  expect_true(length(text) > 3)
})

test_that("use", {
  if (!is_plink_installed(plink_version = "1.7")) return()
  text <- get_plink_help_text(plink_version = "1.7")
  expect_true(is.character(text))
  expect_true(length(text) > 50)
})

test_that("use", {
  if (!is_plink_installed(plink_version = "1.9")) return()
  text <- get_plink_help_text(plink_version = "1.9")
  expect_true(is.character(text))
  expect_true(length(text) > 3)
})
