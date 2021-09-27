#' Call \link[stringr]{str_split} safely
#' stringi::stri_split_regex **sometimes** gives an
#' 'embedded nul in string' error.
#' This has been not been reported, yet a similar report is at
#' https://github.com/gagolews/stringi/issues/458 .
#' Until then, use the workaround
#' @inheritParams default_params_doc
#' @param string one or more strings
#' @param pattern regex, see \link[stringr]{str_split}
#' @param simplify simplify, see \link[stringr]{str_split}
#' @export
safe_str_split <- function(
  string,
  pattern,
  simplify = FALSE,
  verbose = FALSE
) {
  i <- 1
  while (i < 100) {
    tryCatch(
      return(
        stringr::str_split(
          as.character(string),
          pattern = pattern,
          simplify = simplify
        )
      ),
      error = function(e) {
        testthat::expect_true(
          stringr::str_detect(e$message, "embedded nul in string"))
      }
    )
    if (verbose) {
      message(i)
    }
    i <- i + 1
  }
}
