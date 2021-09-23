#' Determine if the \code{PLINK} tutorial data is installed.
#'
#' Determine if the \code{PLINK} tutorial data is installed.
#' The \code{PLINK} tutorial can be found at
#' \url{http://zzz.bwh.harvard.edu/plink/tutorial.shtml}
#' and is done in the \code{plink_tutorial} vignette
#' @inheritParams default_params_doc
#' @return \code{TRUE} if the \code{PLINK} tutorial data
#' is installed, \code{FALSE} otherwise
#' @examples
#' is_plink_tutorial_data_installed()
#' is_plink_tutorial_data_installed(plink_folder = "absent_folder")
#' @author Richèl J.C. Bilderbeek
#' @export
is_plink_tutorial_data_installed <- function( # nolint indeed a long function name
  plink_folder = get_plink_folder()
) {
  tutorial_data_filenames <- file.path(
    plink_folder, "plink_tutorial",
    c("hapmap1.map", "hapmap1.ped", "pop.phe", "qt.phe")
  )
  all(file.exists(tutorial_data_filenames))
}
