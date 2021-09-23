remotes::install_github("richelbilderbeek/plinkr")

i <- 1
while(1) {
  message("Try ", i)
  message("Bare bone")
  x <- stringr::str_trim(
    readr::read_lines(
      plinkr::get_plinkr_filename("frq_within.frq.strat")
    )
  )

  message("Skip empty rows")
  x <- stringr::str_trim(
    readr::read_lines(
      plinkr::get_plinkr_filename("frq_within.frq.strat"),
      skip_empty_rows = TRUE
    )
  )

  message("Do str_split")
  x <- stringr::str_split(
    stringr::str_trim(
      readr::read_lines(
        plinkr::get_plinkr_filename("frq_within.frq.strat"),
        skip_empty_rows = TRUE
      )
    ),
    pattern = "[:blank:]+"
  )

  message("Do str_split with simplify")
  x <- stringr::str_split(
    stringr::str_trim(
      readr::read_lines(
        plinkr::get_plinkr_filename("frq_within.frq.strat"),
        skip_empty_rows = TRUE
      )
    ),
    pattern = "[:blank:]+",
    simplify = TRUE
  )

  i <- i + 1
}

