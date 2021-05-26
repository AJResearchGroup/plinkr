#' Get the path to the default PLINK executable as used by plinkr
#' @inheritParams default_params_doc
#' @return path to the default PLINK executable  as used by plinkr
#' @author Richèl J.C. Bilderbeek
#' @export
get_plink_zip_path <- function(
  plink_version = get_default_plink_version(),
  plink_folder = get_plink_folder()
) {
  plinkr::check_plink_version(plink_version)
  plink_version_str <- stringr::str_replace(
    plink_version,
    pattern = "\\.",
    replacement = "_"
  )
  file.path(
    plink_folder,
    paste0("plink_", plink_version_str, ".zip")
  )
}
