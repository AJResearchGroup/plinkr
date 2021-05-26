#' Uninstall PLINK
#' @inheritParams default_params_doc
#' @return Nothing
#' @author Richèl J.C. Bilderbeek
#' @export
uninstall_plink <- function(
  plink_version = get_default_plink_version(),
  plink_folder = get_plink_folder()
) {
  testthat::expect_true(
    plinkr::is_plink_installed(
      plink_version = plink_version,
      plink_folder = plink_folder
    )
  )
  unpacked_folder_name <- dirname(
    get_plink_exe_path(
      plink_version = plink_version,
      plink_folder = plink_folder
    )
  )
  unlink(unpacked_folder_name, recursive = TRUE)
  testthat::expect_false(
    plinkr::is_plink_installed(
      plink_version = plink_version,
      plink_folder = plink_folder
    )
  )
}
