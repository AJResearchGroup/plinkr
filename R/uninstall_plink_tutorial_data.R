#' Uninstall the \code{PLINK} tutorial data
#'
#' Uninstall the \code{PLINK} tutorial data.
#'
#' The data file will be removed from the \code{plink_folder}
#' and the \code{plink_tutorial} subfolder will be removed.
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if the tutorial data is already uninstalled
#' @seealso use \link{install_plink_tutorial_data} to install
#'   the \code{PLINK} tutorial data
#' @author Richèl J.C. Bilderbeek
#' @export
uninstall_plink_tutorial_data <- function(
  plink_folder = get_plink_folder()
) {
  if (!plinkr::is_plink_tutorial_data_installed(plink_folder = plink_folder)) {
    stop("PLINK tutorial data is already uninstalled")
  }
  plink_zip_path <- file.path(plink_folder, "plink_tutorial.zip")
  file.remove(plink_zip_path)
  unlink(file.path(plink_folder, "plink_tutorial"), recursive = TRUE)
}
