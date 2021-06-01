#' Clear the \code{plinkr} cache
#'
#' Clear the \code{plinkr} cache.
#' @return Nothing.
#' @author Richèl J.C. Bilderbeek
#' @export
clear_plinkr_cache <- function() {
  folder <- dirname(get_plinkr_tempfilename())
  dirs <- list.dirs(folder, full.names = TRUE)
  unlink(dirs, recursive = TRUE)
  files <- list.files(folder, full.names = TRUE)
  file.remove(files)
}
