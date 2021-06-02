#' Create the options to run PLINK v1.7
#'
#' Create the options to run PLINK v1.7
#' @inheritParams default_params_doc
#' @return the PLINK options,
#' as can be checked by \link{check_plink_options}
#' @examples
#' create_plink_v1_7_options()
#' @author Richèl J.C. Bilderbeek
#' @export
create_plink_v1_7_options <- function(
  plink_folder = get_plink_folder(),
  os = get_os()
) {
  plink_version <- "1.7"
  plink_exe_path <- file.path(
    plink_folder,
    plinkr::get_plink_subfolder_name(plink_version = plink_version, os = os),
    plinkr::get_plink_exe_name(plink_version = plink_version, os = os)
  )
  plinkr::create_plink_options(
    plink_exe_path = plink_exe_path,
    plink_version = plink_version,
    os = os
  )
}
