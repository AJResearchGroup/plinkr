#' Uninstall PLINK
#' @inheritParams default_params_doc
#' @return Nothing
#' @author Richèl J.C. Bilderbeek
#' @export
uninstall_plink <- function(
  plink_options = create_plink_options()
) {
  testthat::expect_true(
    plinkr::is_plink_installed(plink_options)
  )
  unpacked_folder_name <- dirname(
    get_plink_exe_path(plink_options)
  )
  unlink(unpacked_folder_name, recursive = TRUE)
  testthat::expect_false(
    plinkr::is_plink_installed(plink_options)
  )
}
