#' Uninstall PLINK
#' @inheritParams default_params_doc
#' @return Nothing
#' @author Richèl J.C. Bilderbeek
#' @export
uninstall_plink <- function(
  plink_options = create_plink_options()
) {
  plinkr::check_plink_options(plink_options)
  if (!plinkr::is_plink_installed(plink_options)) {
    stop(
      "Cannot uninstall a PLINK version that is absent. \n",
      "PLINK version: ", plink_options$plink_version, " \n",
      "PLINK exe path: ", plink_options$plink_exe_path, " \n",
      "OS: ", plink_options$os, " \n",
      "Tip 1: maybe you did not expect 'uninstall_plink' to give an error ",
      "and everything is fine :-)",
      "Tip 2: Use 'plinkr::uninstall_plink' to uninstall ",
      "a seperate PLINK version"
    )
  }
  unpacked_folder_name <- dirname(plink_options$plink_exe_path)
  unlink(unpacked_folder_name, recursive = TRUE)
  testthat::expect_false(
    plinkr::is_plink_installed(plink_options)
  )
}
