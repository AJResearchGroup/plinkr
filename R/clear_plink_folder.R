#' Deletes all files in the default \code{PLINK} folder
#'
#' Deletes all files in the default \code{PLINK} folder,
#' as obtained by \link{get_plink_folder}
#' @return Nothing.
#' @author Richèl J.C. Bilderbeek
#' @export
clear_plink_folder <- function(
  plink_folder = get_plink_folder()
) {
  dirs <- list.dirs(plink_folder, full.names = TRUE)
  unlink(dirs, recursive = TRUE)
  files <- list.files(plink_folder, full.names = TRUE)
  file.remove(files)
}
