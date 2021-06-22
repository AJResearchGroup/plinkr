test_that("use", {
  frq_filename <- system.file(
    "extdata",
    "miss_stat.frq",
    package = "plinkr"
  )
  frq_table <- read_plink_frq_file(
    frq_filename = frq_filename
  )
  expect_true("CHR" %in% names(frq_table))
  expect_true("SNP" %in% names(frq_table))
  expect_true("A1" %in% names(frq_table))
  expect_true("A2" %in% names(frq_table))
  expect_true("MAF" %in% names(frq_table))
  expect_true("NCHROBS" %in% names(frq_table))
})
