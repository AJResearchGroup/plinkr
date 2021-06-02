#' Get the path to the default PLINK executable as used by plinkr
#' @inheritParams default_params_doc
#' @return path to the default PLINK executable  as used by plinkr
#' @author Richèl J.C. Bilderbeek
#' @export
get_default_plink_exe_path <- function(
  plink_version = get_default_plink_version(),
  os = get_os()
) {
  plinkr::check_plink_version(plink_version)
  plinkr::check_os(os)
  if (plink_version == "custom") {
    stop("Cannot predict the PLINK executable path for a custom PLINK version")
  }

  plink_subfolder <- plinkr::get_plink_subfolder_name(
    plink_version = plink_version,
    os = os
  )
  exe_name <- plinkr::get_plink_exe_name(
    plink_version = plink_version,
    os = os
  )
  file.path(
    get_plink_folder(),
    plink_subfolder,
    exe_name
  )
}
