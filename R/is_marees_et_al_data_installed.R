#' Determine if the tutorial data of Marees et al., 2018 is installed.
#'
#' Determine if the tutorial data of Marees et al., 2018 is installed.
#'
#'  * Paper: \url{https://onlinelibrary.wiley.com/doi/10.1002/mpr.1608}
#'  * Code: \url{https://github.com/MareesAT/GWA_tutorial}
#'
#' The code is re-done using plinkr in the vignette 'marees_et_al_2018'
#' @inheritParams default_params_doc
#' @return \code{TRUE} if the tutorial data of Marees et al., 2018
#' is installed, \code{FALSE} otherwise
#' @examples
#' is_marees_et_al_data_installed()
#' is_marees_et_al_data_installed(plink_folder = "absent_folder")
#' @author Richèl J.C. Bilderbeek
#' @export
is_marees_et_al_data_installed <- function( # nolint indeed a long function name
  plink_folder = get_plink_folder()
) {
  if (1 == 2) {
    tutorial_data_filenames <- file.path(
      plink_folder, "plink_tutorial",
      c("hapmap1.map", "hapmap1.ped", "pop.phe", "qt.phe")
    )
    all(file.exists(tutorial_data_filenames))
  }
  FALSE
}
