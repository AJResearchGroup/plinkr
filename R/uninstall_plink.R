#' Uninstall PLINK
#' @inheritParams default_params_doc
#' @return Nothing
#' @export
uninstall_plink <- function(
  plink_folder = get_plink_folder()
) {
  testthat::expect_true(is_plink_installed(plink_folder = plink_folder))
  unlink(plink_folder, recursive = TRUE)
  testthat::expect_false(is_plink_installed(plink_folder = plink_folder))
}
