#' Create the options to run PLINK
#'
#' Create the options to run PLINK.
#' Options are:
#'
#'  * \link{create_plink_v1_7_options}: use PLINK v1.7
#'  * \link{create_plink_v1_9_options}: use PLINK v1.9
#'  * \link{create_custom_plink_options}: use a custom version of PLINK
#'
#' Prefer to call these more specialized functions.
#' @inheritParams default_params_doc
#' @return the PLINK options,
#' as can be checked by \link{check_plink_options}
#' @examples
#' # Use the default PLINK version
#' create_plink_options()
#'
#' # Use PLINK v1.7
#' create_plink_v1_7_options()
#'
#' # Use PLINK v1.9
#' create_plink_v1_9_options()
#'
#' # Use PLINK v2.0
#' create_plink_v2_0_options()
#'
#' # Use a custom PLINK version
#' create_custom_plink_options(
#'   plink_exe_path = "path_to_my_custom_plink_folder/plink3.mp4"
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
create_plink_options <- function(
  plink_version = get_default_plink_version(),
  plink_exe_path = get_default_plink_exe_path(),
  os = get_os()
) {
  plinkr::check_plink_version(plink_version)
  plinkr::check_os(os)
  list(
    plink_version = plink_version,
    plink_exe_path = plink_exe_path,
    os = os
  )
}
