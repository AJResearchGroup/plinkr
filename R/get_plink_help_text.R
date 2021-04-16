#' Get the text of the PLINK help file
#' @inheritParams default_params_doc
#' @return the text of the PLINK help file
#' @export
get_plink_help_text <- function(
  plink_folder = get_plink_folder()
) {
  plinkr::check_plink_is_installed(plink_folder = plink_folder)
  plink_exe_path <- plinkr::get_plink_exe_path(plink_folder = plink_folder)
  system2(
    command = normalizePath(plink_exe_path),
    args = "--help",
    stdout = TRUE
  )
}
