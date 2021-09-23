test_that("use", {
  frq_strat_filename <- plinkr::get_plinkr_filename("frq_within.frq.strat")
  read_plink_frq_strat_file(frq_strat_filename = frq_strat_filename)
  while (1) {
    message("X")
    read.table(plinkr::get_plinkr_filename("frq_within.frq.strat"))
    readr::read_lines(plinkr::get_plinkr_filename("frq_within.frq.strat"))
    stringi::stri_enc_detect()
    f <- rawToChar(readBin(frq_strat_filename, 'raw', 100000))
    stringi::stri_enc_detect(f)
  }
})
