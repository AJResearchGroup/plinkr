test_that("use", {
  if (!is_plink_installed()) return()
  expect_silent(get_plink_version())
  text <- get_plink_version()
  expect_true(is.character(text))
  expect_true(length(text) == 1)
})

test_that("use, v1.7", {
  if (!is_plink_installed(create_plink_v1_7_options())) return()
  text <- get_plink_version(create_plink_v1_7_options())
  expect_true(is.character(text))
  expect_true(length(text) == 1)
  expect_equal(text, "v1.07")
})

test_that("use, v1.9", {
  if (!is_plink_installed(create_plink_v1_9_options())) return()
  text <- get_plink_version(create_plink_v1_9_options())
  expect_true(is.character(text))
  expect_true(length(text) == 1)
  expect_equal(text, "v1.90")
})
