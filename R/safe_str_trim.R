#' Call \link[stringr]{str_trim} safely
#' stringi::str_trim **sometimes** gives an 'embedded nul in string' error.
#' This has been reported at https://github.com/gagolews/stringi/issues/458 .
#' Until then, just try multiple times :-)
#' @param string one or more strings
#' @export
safe_str_trim <- function(string) {
  while (1) {
    tryCatch(
      return(stringr::str_trim(string)),
      error = function(e) {} # nolint ignore
    )
  }
}
