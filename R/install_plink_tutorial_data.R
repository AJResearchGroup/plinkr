#' Install the \code{PLINK} tutorial data
#'
#' Install the \code{PLINK} tutorial data.
#'
#' The data will be downloaded in the \code{plink_folder}
#' and extracted in the \code{plink_tutorial} subfolder.
#'
#' The \code{PLINK} tutorial can be found at
#' \url{http://zzz.bwh.harvard.edu/plink/tutorial.shtml}
#' and is done in the \code{plink_tutorial} vignette
#' @inheritParams default_params_doc
#' @param tutorial_data_url the URL where the tutorial data is downloaded
#' from
#' @return Nothing. Will \link{stop} if the tutorial data is already installed
#' @seealso use \link{uninstall_plink_tutorial_data} to uninstall
#'   the \code{PLINK} tutorial data
#' @author Richèl J.C. Bilderbeek
#' @export
install_plink_tutorial_data <- function(
  tutorial_data_url = "http://zzz.bwh.harvard.edu/plink/hapmap1.zip",
  plink_folder = get_plink_folder()
) {
  if (plinkr::is_plink_tutorial_data_installed(plink_folder = plink_folder)) {
    stop(
      "PLINK tutorial data is already installed. \n",
      "plink_folder: ", plink_folder
    )
  }

  plink_zip_path <- file.path(plink_folder, "plink_tutorial.zip")
  dir.create(
    path = dirname(plink_zip_path),
    showWarnings = FALSE,
    recursive = TRUE
  )
  if (!file.exists(plink_zip_path)) {
    utils::download.file(
      url = tutorial_data_url,
      destfile = plink_zip_path,
      quiet = TRUE
    )
  }
  testthat::expect_true(file.exists(plink_zip_path))

  tutorial_data_filenames <- file.path(
    plink_folder, "plink_tutorial",
    c("hapmap1.map", "hapmap1.ped", "pop.phe", "qt.phe")
  )
  plink_sub_folder <- dirname(tutorial_data_filenames[1])
  dir.create(plink_sub_folder, showWarnings = FALSE, recursive = TRUE)

  if (!all(file.exists(tutorial_data_filenames))) {
    utils::unzip(
      plink_zip_path,
      exdir = plink_sub_folder
    )
  }
  testthat::expect_true(all(file.exists(tutorial_data_filenames)))
}
