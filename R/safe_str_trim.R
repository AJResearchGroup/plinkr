#' Call \link[stringr]{str_trim} safely
#' stringi::str_trim **sometimes** gave an 'embedded nul in string' error.
#' This has been reported at https://github.com/gagolews/stringi/issues/458 .
#' Until then, just try multiple times :-)
#' @param string one or more strings
#' @export
safe_str_trim <- function(string) {
  stringr::str_trim(string)
}
