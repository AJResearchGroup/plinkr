test_that("use", {
  if (!is_plink_installed()) return()
  expect_silent(get_plink_help_text())

  text <- get_plink_help_text()
  expect_true(is.character(text))
  expect_true(length(text) > 3)
})

test_that("v1.7", {
  if (!is_plink_installed(create_plink_v1_7_options())) return()
  text <- get_plink_help_text(create_plink_v1_7_options())
  expect_true(is.character(text))
  expect_true(length(text) > 50)
})

test_that("v1.9", {
  if (!is_plink_installed(create_plink_v1_9_options())) return()
  text <- get_plink_help_text(create_plink_v1_9_options())
  expect_true(is.character(text))
  expect_true(length(text) > 3)
})

test_that("custom, secretly use v1.7", {
  if (!is_plink_installed(create_plink_v1_7_options())) return()
  plink_exe_path <- create_plink_v1_7_options()$plink_exe_path
  text_custom <- get_plink_help_text(
    create_custom_plink_options(plink_exe_path = plink_exe_path)
  )
  text_v1_7 <- get_plink_help_text(create_plink_v1_7_options())

  # The last lines contain a timestamp
  expect_equal(text_custom[1:77], text_v1_7[1:77])
})

test_that("custom, secretly use v1.9", {
  if (!is_plink_installed(create_plink_v1_9_options())) return()

  text_custom <- get_plink_help_text(
    create_custom_plink_options(create_plink_v1_9_options()$plink_exe_path)
  )
  text_v1_9 <- get_plink_help_text(create_plink_v1_9_options())
  expect_equal(text_custom, text_v1_9)
})
