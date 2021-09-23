test_that("use", {
  frq_strat_filename <- plinkr::get_plinkr_filename("frq_within.frq.strat")
  read_plink_frq_strat_file(frq_strat_filename = frq_strat_filename)
  while (1) {
    message("X")
    read.table(frq_strat_filename)
  }
})
