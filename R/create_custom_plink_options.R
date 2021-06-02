#' Create the options to run a custom PLINK version
#'
#' Create the options to run a custom PLINK version
#' @inheritParams default_params_doc
#' @return the PLINK options,
#' as can be checked by \link{check_plink_options}
#' @examples
#' create_custom_plink_options("path_to_my_custom_plink_folder")
#' @author Richèl J.C. Bilderbeek
#' @export
create_custom_plink_options <- function(
  plink_exe_path,
  os = get_os()
) {
  plinkr::create_plink_options(
    plink_version = "custom",
    plink_exe_path = plink_exe_path,
    os = os
  )
}
