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
      "PLINK version: ", plink_options$plink_version ," \n",
      "PLINK folder: ", plink_options$plink_folder ," \n",
      "OS: ", plink_options$os ," \n",
      "Tip: maybe you did not expect 'uninstall_plink' to give an error ",
      "and everything is fine :-)"
    )
  }
  unpacked_folder_name <- dirname(
    get_plink_exe_path(plink_options)
  )
  unlink(unpacked_folder_name, recursive = TRUE)
  testthat::expect_false(
    plinkr::is_plink_installed(plink_options)
  )
}
