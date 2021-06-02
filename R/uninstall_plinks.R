#' Uninstall multiple versions of PLINK
#'
#' Uninstall multiple versions of PLINK.
#' This deletes only the PLINK folders that are expected to be
#' present.
#' Use \link{clear_plink_folder} to ruthlessly delete all files in the PLINK
#' folder.
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
uninstall_plinks <- function(
  plink_optionses = create_plink_optionses()
) {
  plinkr::check_plink_optionses(plink_optionses)
  for (plink_options in plink_optionses) {
    plinkr::uninstall_plink(plink_options)
  }
}
