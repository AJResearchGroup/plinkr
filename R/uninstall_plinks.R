#' Uninstall multiple versions of PLINK
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
uninstall_plinks <- function(
  plink_optionses = create_plink_optionses()
) {
  for (plink_options in plink_optionses) {
    plinkr::check_plink_options(plink_options)
    plinkr::uninstall_plink(plink_options)
  }
}
