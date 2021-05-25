test_that("use", {
  if (!is_plink_installed()) return()
  expect_silent(get_plink_version())
  text <- get_plink_version()
  expect_true(is.character(text))
  expect_true(length(text) == 1)
})

test_that("use, v1.7", {
  if (!is_plink_installed(plink_version = "1.7")) return()
  text <- get_plink_version(
    plink_version = "1.7"
  )
  expect_true(is.character(text))
  expect_true(length(text) == 1)
  expect_equal(text, "v1.07")
})

test_that("use, v1.9", {
  if (!is_plink_installed(plink_version = "1.9")) return()
  text <- get_plink_version(
    plink_version = "1.9"
  )
  expect_true(is.character(text))
  expect_true(length(text) == 1)
  expect_equal(text, "v1.90")
})
