#' Determine if a file can be executed
#' @param filename path to a filename
#' @return TRUE if the file can be executed, FALSE otherwise
is_exe <- function(filename) {
  as.numeric(file.access(filename, mode = 1)) == 0
}
