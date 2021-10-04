#' Call \link[stringr]{str_split} safely
#' stringi::stri_split_regex **sometimes** gave an
#' 'embedded nul in string' error.
#' @param string one or more strings
#' @export
safe_str_split <- function(
  string
) {
  stringr::str_split(
    string,
    pattern = "[:blank:]+",
    simplify = TRUE
  )
}
