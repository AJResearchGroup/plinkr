#' Get the full paths to all plinkr files
#' @return the full paths to all plinkr files
#' @export
#' @examples
#' get_plinkr_filenames()
get_plinkr_filenames <- function(
) {
  list.files(
    system.file("extdata", package = "plinkr"),
    full.names = TRUE
  )
}
