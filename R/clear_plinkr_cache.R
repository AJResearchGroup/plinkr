#' Clear the \link{plinkr} cache
#'
#' Clear the \link{plinkr} cache.
#' @inheritParams default_params_doc
#' @return Nothing.
#' @author Richèl J.C. Bilderbeek
#' @export
clear_plinkr_cache <- function(
  plinkr_folder = get_plinkr_folder()
) {
  dirs <- list.dirs(plinkr_folder, full.names = TRUE)
  unlink(dirs, recursive = TRUE)
  files <- list.files(plinkr_folder, full.names = TRUE)
  file.remove(files)
  invisible(plinkr_folder)
}
