remotes::install_github("richelbilderbeek/plinkr")

while(1) {
  x <- stringr::str_split(
    stringr::str_trim(
      readr::read_lines(
        plinkr::get_plinkr_filename("frq_within.frq.strat"), skip_empty_rows = TRUE
      )
    ), 
    pattern = "[:blank:]+", 
    simplify = TRUE
  )
}

