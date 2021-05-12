test_that("use", {
  text <- get_plink_help_text()
  log <- read_plink_log_file("plink.log")
  expect_true(all(log %in% text))
})
