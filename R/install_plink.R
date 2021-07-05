#' Install a specific version of PLINK
#' @inheritParams default_params_doc
#' @return Nothing
#' @author Richèl J.C. Bilderbeek
#' @export
install_plink <- function(
  plink_options = create_plink_options()
) {
  plinkr::check_plink_options(plink_options)
  testthat::expect_false(
    plinkr::is_plink_installed(plink_options)
  )

  plink_zip_path <- plinkr::get_plink_zip_path(plink_options)
  dir.create(
    path = dirname(plink_zip_path),
    showWarnings = FALSE,
    recursive = TRUE
  )

  if (!file.exists(plink_zip_path)) {
    utils::download.file(
      url = plinkr::get_plink_download_url(
        plink_version = plink_options$plink_version,
        os = plink_options$os
      ),
      destfile = plink_zip_path,
      quiet = TRUE
    )
  }
  testthat::expect_true(file.exists(plink_zip_path))
  plink_exe_path <- plink_options$plink_exe_path

  plink_sub_folder <- dirname(plink_exe_path)
  dir.create(plink_sub_folder, showWarnings = FALSE, recursive = TRUE)

  if (!file.exists(plink_exe_path)) {
    utils::unzip(
      plink_zip_path,
      exdir = plink_sub_folder
    )
  }
  if (plink_options$plink_version == "1.7") {
    # v1.7 extracts into an own subfolder. Move files up.
    from <- list.files(plink_sub_folder, full.names = TRUE, recursive = TRUE)
    to <- file.path(dirname(dirname(from)), basename(from))
    file.copy(from = from, to = to)
    unlink(dirname(from[1]), recursive = TRUE)
  }

  testthat::expect_true(file.exists(plink_exe_path))

  if (get_os() != "win" && !plinkr::is_exe(plink_exe_path)) {
    Sys.chmod(plink_exe_path, "777")
  }
  testthat::expect_true(plinkr::is_exe(plink_exe_path))
  testthat::expect_true(
    plinkr::is_plink_installed(plink_options)
  )
}
