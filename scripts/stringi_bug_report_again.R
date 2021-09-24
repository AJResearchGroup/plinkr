remotes::install_github("richelbilderbeek/plinkr")

i <- 1
while(1) {
  message("Try ", i)
  message("Bare bone")
  tryCatch(
    x <- stringi::stri_trim_both(
      readr::read_lines(
        plinkr::get_plinkr_filename("frq_within.frq.strat")
      )
    ), error = function(e) { message(e) }
  )

  message("Skip empty rows")
  tryCatch(
    x <- stringi::stri_trim_both(
      readr::read_lines(
        plinkr::get_plinkr_filename("frq_within.frq.strat"),
        skip_empty_rows = TRUE
      )
    ), error = function(e) {message(e)}
  )

  message("Do str_split")
  tryCatch(
    x <- stringr::str_split(
      stringi::stri_trim_both(
        readr::read_lines(
          plinkr::get_plinkr_filename("frq_within.frq.strat"),
          skip_empty_rows = TRUE
        )
      ),
      pattern = "[:blank:]+"
    ), error = function(e) {message(e)}
  )

  message("Do str_split with simplify")
  tryCatch(
    x <- stringr::str_split(
      stringi::stri_trim_both(
        readr::read_lines(
          plinkr::get_plinkr_filename("frq_within.frq.strat"),
          skip_empty_rows = TRUE
        )
      ),
      pattern = "[:blank:]+",
      simplify = TRUE
    ), error = function(e) {message(e)}
  )

  i <- i + 1
}

