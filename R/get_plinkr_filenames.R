#' Get the full paths to all plinkr files
#' @return the full paths to all plinkr files
#' @examples
#' get_plinkr_filenames()
#' @author Richèl J.C. Bilderbeek
#' @export
get_plinkr_filenames <- function(
) {
  list.files(
    system.file("extdata", package = "plinkr"),
    full.names = TRUE
  )
}
