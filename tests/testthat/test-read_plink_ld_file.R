test_that("use", {
  skip("WIP")
  ld_filename <- get_plinkr_filename("miss_stat.frq")
  ld_table <- read_plink_ld_file(
    ld_filename = ld_filename
  )
  expect_true("CHR" %in% names(ld_table))
  expect_true("SNP" %in% names(ld_table))
  expect_true("A1" %in% names(ld_table))
  expect_true("A2" %in% names(ld_table))
  expect_true("MAF" %in% names(ld_table))
  expect_true("NCHROBS" %in% names(ld_table))
  expect_silent(check_empty_plinkr_folder())
})
