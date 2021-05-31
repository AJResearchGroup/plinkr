#' Check if PLINK is installed
#'
#' Check if PLINK is installed. Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if PLINK is not installed.
#' @author Richèl J.C. Bilderbeek
#' @export
check_plink_is_installed <- function(
  plink_options = create_plink_options()
) {
  plinkr::check_plink_options(plink_options)

  plink_exe_path <- plinkr::get_plink_exe_path(
    plink_options = plink_options
  )
  if (!file.exists(plink_exe_path)) {
    stop(
      "PLINK is not installed. \n",
      "Executable is not found \n",
      "PLINK folder: ", plink_options$plink_folder, " \n",
      "PLINK executable: ", plink_exe_path, " \n",
      "Tip: run 'plinkr::install_plinks()'"
    )
  }
  if (!plinkr::is_exe(plink_exe_path)) {
    stop(
      "PLINK is not installed. \n",
      "PLINK binary is not executable \n",
      "PLINK folder: ", plink_options$plink_folder, " \n",
      "PLINK executable: ", plink_exe_path, " \n",
      "Tip: run 'plinkr::install_plinks()'"
    )
  }
}
