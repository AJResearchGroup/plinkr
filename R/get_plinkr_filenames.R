#' Get the full paths to all plinkr files
#' @param pattern an optional regular expression,
#' as used by \link{list.files}.
#' Only file names which match the regular expression will be returned.
#' @return the full paths to all plinkr files
#' @examples
#' get_plinkr_filenames()
#' get_plinkr_filenames(pattern = ".ped")
#' @author Richèl J.C. Bilderbeek
#' @export
get_plinkr_filenames <- function(
  pattern = NULL
) {
  list.files(
    system.file("extdata", package = "plinkr"),
    full.names = TRUE,
    pattern = pattern
  )
}
