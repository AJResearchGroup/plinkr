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
#' @return Nothing. Will \link{stop} if the tutorial data is already installed
#' @seealso use \link{uninstall_plink_tutorial_data} to uninstall
#'   the \code{PLINK} tutorial data
#' @author Richèl J.C. Bilderbeek
#' @export
get_plink_tutorial_data_filenames <- function( # nolint indeed a long function name
  plink_folder = get_plink_folder()
) {
  if (!plinkr::is_plink_tutorial_data_installed(plink_folder = plink_folder)) {
    stop(
      "PLINK tutorial data is not installed. \n",
      "plink_folder: ", plink_folder, "\n",
      "Tip: run 'plinkr::install_plink_tutorial_data()'"
    )
  }
  tutorial_data_filenames <- file.path(
    plink_folder, "plink_tutorial",
    c("hapmap1.map", "hapmap1.ped", "pop.phe", "qt.phe")
  )
  testthat::expect_true(all(file.exists(tutorial_data_filenames)))
  tutorial_data_filenames
}
