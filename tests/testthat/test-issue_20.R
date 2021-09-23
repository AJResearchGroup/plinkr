test_that("use", {
  skip("Prevent 'embedded nul in string'")
  # Bug is reported at https://github.com/tidyverse/stringr/issues/399
  frq_strat_filename <- plinkr::get_plinkr_filename("frq_within.frq.strat")

  # This line will pass :-)
  expect_error(
    while (1) {
      read_plink_frq_strat_file(frq_strat_filename = frq_strat_filename)
    },
    "embedded nul in string"
  )
})
