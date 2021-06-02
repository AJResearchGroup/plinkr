#' #' Get the path to the default PLINK executable as used by plinkr
#' #' @inheritParams default_params_doc
#' #' @return path to the default PLINK executable  as used by plinkr
#' #' @author Richèl J.C. Bilderbeek
#' #' @export
#' get_plink_exe_path <- function(
#'   plink_options = create_plink_options()
#' ) {
#'   plinkr::check_plink_options(plink_options)
#'
#'   if (plink_options$plink_version == "custom") {
#'     return(
#'       file.path(
#'         plink_options$plink_folder,
#'         "plink"
#'       )
#'     )
#'   }
#'
#'   plink_subfolder <- plinkr::get_plink_subfolder_name(plink_options)
#'   exe_name <- plinkr::get_plink_exe_name(plink_options)
#'   file.path(
#'     plink_options$plink_folder,
#'     plink_subfolder,
#'     exe_name
#'   )
#' }
