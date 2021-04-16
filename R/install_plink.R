#' Determine if PLINK is installed
#' @inheritParams default_params_doc
#' @return Nothing
#' @export
install_plink <- function(
  url = "http://zzz.bwh.harvard.edu/plink/dist/plink-1.07-x86_64.zip",
  plink_folder = get_plink_folder()
) {
  testthat::expect_false(is_plink_installed(plink_folder = plink_folder))

  dir.create(
    path = plink_folder,
    showWarnings = FALSE,
    recursive = TRUE
  )
  plink_zip_path <- file.path(plink_folder, "plink.zip")
  if (!file.exists(plink_zip_path)) {
    utils::download.file(
      url = url,
      destfile = plink_zip_path,
      quiet = TRUE
    )
  }
  testthat::expect_true(file.exists(plink_zip_path))
  plink_exe_path <- get_plink_exe_path(plink_folder = plink_folder)
  if (!file.exists(plink_exe_path)) {
    utils::unzip(
      plink_zip_path,
      exdir = plink_folder
    )
  }
  testthat::expect_true(file.exists(plink_exe_path))
  if (!plinkr::is_exe(plink_exe_path)) {
    Sys.chmod(plink_exe_path, "777")
  }
  testthat::expect_true(plinkr::is_exe(plink_exe_path))
  testthat::expect_true(is_plink_installed(plink_folder = plink_folder))
}
