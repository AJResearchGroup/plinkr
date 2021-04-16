#' Check if PLINK is installed
#'
#' Check if PLINK is installed. Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if PLINK is not installed.
#' @export
check_plink_is_installed <- function(
  plink_folder = get_plink_folder()
) {
  plink_zip_path <- file.path(plink_folder, "plink.zip")
  if (!file.exists(plink_zip_path)) {
    stop(
      "PLINK is not installed. \n",
      "ZIP file not downloaded. \n",
      "PLINK folder: ", plink_folder, " \n",
      "PLINK zip path: ", plink_zip_path, " \n",
      "Tip: run 'plinkr::install_plink()'"
    )
  }

  plink_exe_path <- file.path(plink_folder, "plink-1.07-x86_64", "plink")
  if (!file.exists(plink_exe_path)) {
    stop(
      "PLINK is not installed. \n",
      "Executable is not found \n",
      "PLINK folder: ", plink_folder, " \n",
      "PLINK executable: ", plink_exe_path, " \n",
      "Tip: run 'plinkr::install_plink()'"
    )
  }
  if (!plinkr::is_exe(plink_exe_path)) {
    stop(
      "PLINK is not installed. \n",
      "PLINK binary is not executable \n",
      "PLINK folder: ", plink_folder, " \n",
      "PLINK executable: ", plink_exe_path, " \n",
      "Tip: run 'plinkr::install_plink()'"
    )
  }
}
