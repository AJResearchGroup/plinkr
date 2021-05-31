#' Install a specific version of PLINK
#' @inheritParams default_params_doc
#' @return Nothing
#' @author Richèl J.C. Bilderbeek
#' @export
install_plink <- function(
  plink_options = create_plink_options(),
  os = get_os()
) {
  plinkr::check_plink_options(plink_options)
  testthat::expect_false(
    plinkr::is_plink_installed(plink_options)
  )

  plink_zip_path <- get_plink_zip_path(plink_options)
  dir.create(
    path = dirname(plink_zip_path),
    showWarnings = FALSE,
    recursive = TRUE
  )

  if (!file.exists(plink_zip_path)) {
    utils::download.file(
      url = plinkr::get_plink_download_url(
        plink_version = plink_options$plink_version,
        os = os
      ),
      destfile = plink_zip_path,
      quiet = TRUE
    )
  }
  testthat::expect_true(file.exists(plink_zip_path))
  plink_exe_path <- plinkr::get_plink_exe_path(plink_options)

  # Plink 1.7 comes with a zip that creates a subfolder, v1.9 does not
  plink_sub_folder <- plink_options$plink_folder
  if (plink_options$plink_version == "1.9") {
    plink_sub_folder <- file.path(plink_sub_folder, "plink_1_9")
  }

  if (!file.exists(plink_exe_path)) {
    utils::unzip(
      plink_zip_path,
      exdir = plink_sub_folder
    )
  }
  testthat::expect_true(file.exists(plink_exe_path))
  if (!plinkr::is_exe(plink_exe_path)) {
    Sys.chmod(plink_exe_path, "777")
  }
  testthat::expect_true(plinkr::is_exe(plink_exe_path))
  testthat::expect_true(
    plinkr::is_plink_installed(plink_options)
  )
}
