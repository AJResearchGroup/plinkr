test_that("use", {
  frq_filename <- get_plinkr_filename("miss_stat.frq")
  frq_table <- read_plink_frq_file(
    frq_filename = frq_filename
  )
  expect_true("CHR" %in% names(frq_table))
  expect_true("SNP" %in% names(frq_table))
  expect_true("A1" %in% names(frq_table))
  expect_true("A2" %in% names(frq_table))
  expect_true("MAF" %in% names(frq_table))
  expect_true("NCHROBS" %in% names(frq_table))
  if (get_os() != "win") expect_silent(check_empty_plinkr_folder())
})
