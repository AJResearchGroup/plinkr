test_that("use", {
  lines <- readr::read_lines(
    plinkr::get_plinkr_filename("frq_within.frq.strat")
  )
  expect_silent(safe_str_trim(lines))

  expect_equal(
    safe_str_trim(lines),
    stringr::str_trim(lines)
  )
})
