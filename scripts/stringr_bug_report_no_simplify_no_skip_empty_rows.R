remotes::install_github("richelbilderbeek/plinkr")

while(1) {
  message("Try again")
  x <- stringr::str_split(
    stringr::str_trim(
      readr::read_lines(
        plinkr::get_plinkr_filename("frq_within.frq.strat")
      )
    ), 
    pattern = "[:blank:]+"
  )
}

