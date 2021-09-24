test_that("use", {
  lines <- readr::read_lines(
    plinkr::get_plinkr_filename("frq_within.frq.strat")
  )
  safe_str_trim(lines)
})
