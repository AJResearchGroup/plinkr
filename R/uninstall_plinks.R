#' Uninstall multiple versions of PLINK
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
uninstall_plinks <- function(
  plink_versions = get_plink_versions(),
  plink_folder = get_plink_folder()
) {
  for (plink_version in plink_versions) {
    plinkr::check_plink_version(plink_version)
    plinkr::uninstall_plink(
      plink_version = plink_version,
      plink_folder = plink_folder
    )
  }
}
