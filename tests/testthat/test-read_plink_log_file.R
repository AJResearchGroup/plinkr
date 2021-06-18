test_that("use, v1.7", {
  if (!is_plink_installed(create_plink_v1_7_options())) return()
  text <- get_plink_help_text(create_plink_v1_7_options())
  log <- read_plink_log_file("plink.log")
  expect_true(all(log %in% text))
})

test_that("use, v1.9", {
  if (!is_plink_installed(create_plink_v1_9_options())) return()
  text <- get_plink_help_text(create_plink_v1_9_options())
  expect_true(length(text) > 100)
})
