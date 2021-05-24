#' Install a specific version of PLINK
#' @inheritParams default_params_doc
#' @return Nothing
#' @export
install_plink <- function(
  plink_version = get_default_plink_version(),
  plink_folder = get_plink_folder()
) {
  plinkr::check_plink_version(plink_version)
  testthat::expect_false(
    plinkr::is_plink_installed(plink_folder = plink_folder)
  )

  dir.create(
    path = plink_folder,
    showWarnings = FALSE,
    recursive = TRUE
  )

  plink_zip_path <- get_plink_zip_path(
    plink_version = plink_version,
    plink_folder = plink_folder
  )
  if (!file.exists(plink_zip_path)) {
    utils::download.file(
      url = plinkr::get_plink_download_url(plink_version = plink_version),
      destfile = plink_zip_path,
      quiet = TRUE
    )
  }
  testthat::expect_true(file.exists(plink_zip_path))
  plink_exe_path <- plinkr::get_plink_exe_path(
    plink_version = plink_version,
    plink_folder = plink_folder
  )
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
  testthat::expect_true(
    plinkr::is_plink_installed(
      plink_version = plink_version,
      plink_folder = plink_folder
    )
  )
}

