#' Determine if PLINK is installed
#' @inheritParams default_params_doc
#' @return TRUE if PLINK is installed, FALSE otherwise
#' @author Richèl J.C. Bilderbeek
#' @export
is_plink_installed <- function(
  plink_version = get_default_plink_version(),
  plink_folder = get_plink_folder()
) {
  plinkr::check_plink_version(plink_version)
  is_installed <- FALSE
  tryCatch({
    plinkr::check_plink_is_installed(
      plink_version = plink_version,
      plink_folder = plink_folder
    )
    is_installed <- TRUE
  }, error = function(e) {} # nolint indeed ignore error message
  )
  is_installed
}
