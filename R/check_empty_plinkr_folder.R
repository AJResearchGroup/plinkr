#' Check there are no files in the default \link{plinkr} folder
#'
#' Check there are no files in the default \link{plinkr} folder.
#' The goal is to make sure no temporary files are left undeleted.
#' Will \link{stop} if there are files in the \link{plinkr} folder
#' @inheritParams default_params_doc
#' @return Nothing.
#' @author Richèl J.C. Bilderbeek
#' @export
check_empty_plinkr_folder <- function(
  plinkr_folder = get_plinkr_folder()
) {
  dirs <- list.dirs(plinkr_folder)
  dirs <- dirs[dirs != normalizePath(plinkr_folder, mustWork = FALSE)]

  if (length(dirs) != 0) {
    stop(
      "Folders found in plinkr folder. \n",
      "plinkr_folder: ", plinkr_folder, " \n",
      "length(list.dirs(plinkr_folder)): ", length(dirs), " \n",
      "head(list.dirs(plinkr_folder)): ", paste(head(dirs), collapse = ",")
    )
  }
  filenames <- list.files(plinkr_folder, full.names = TRUE, recursive = TRUE)
  if (length(filenames) != 0) {
    stop(
      "Files found in plinkr folder. \n",
      "plinkr_folder: ", plinkr_folder, " \n",
      "length(list.files(plinkr_folder))): ", length(filenames), " \n",
      "head(list.files(plinkr_folder)): ",
        paste(head(filenames), collapse = ",")
    )
  }
}
