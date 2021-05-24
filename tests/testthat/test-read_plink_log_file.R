test_that("use, v1.7", {
  text <- get_plink_help_text(plink_version = "1.7")
  log <- read_plink_log_file("plink.log")
  expect_true(all(log %in% text))
})

test_that("use, v1.9", {
  text <- get_plink_help_text(plink_version = "1.9")
  log <- c(
    "PLINK v1.90b6.22 64-bit (16 Apr 2021)          www.cog-genomics.org/plink/1.9/", # nolint indeed a long line
    "(C) 2005-2021 Shaun Purcell, Christopher Chang   GNU General Public License v3", # nolint indeed a long line
    "",
    "No help entry for '--noweb'."
  )
  expect_true(all(log %in% text))
})
