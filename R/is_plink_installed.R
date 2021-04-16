#' Determine if PLINK is installed
#' @inheritParams default_params_doc
#' @return TRUE if PLINK is installed, FALSE otherwise
#' @export
is_plink_installed <- function(
  plink_folder = get_plink_folder()
) {
  plink_exe_path <- file.path(plink_folder, "plink-1.07-x86_64", "plink")
  file.exists(plink_exe_path)
}
