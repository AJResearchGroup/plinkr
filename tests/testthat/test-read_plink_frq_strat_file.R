test_that("use", {
  frq_strat_filename <- get_plinkr_filename("miss_stat.frq.strat")
  frq_strat_table <- read_plink_frq_strat_file(
    frq_strat_filename = frq_strat_filename
  )
  expect_true("CHR" %in% names(frq_strat_table))
  expect_true("SNP" %in% names(frq_strat_table))
  expect_true("CLST" %in% names(frq_strat_table))
  expect_true("A1" %in% names(frq_strat_table))
  expect_true("A2" %in% names(frq_strat_table))
  expect_true("MAC" %in% names(frq_strat_table))
  expect_true("MAF" %in% names(frq_strat_table))
  expect_true("NCHROBS" %in% names(frq_strat_table))
})
