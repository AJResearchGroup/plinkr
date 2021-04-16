#' Determine if PLINK is installed
#' @inheritParams default_params_doc
#' @return TRUE if PLINK is installed, FALSE otherwise
#' @export
is_plink_installed <- function(
  plink_folder = get_plink_folder()
) {
  is_installed <- FALSE
  tryCatch({
    plinkr::check_plink_is_installed(plink_folder = plink_folder)
    is_installed <- TRUE
  }, error = function(e) {} # nolint indeed ignore error message
  )
  is_installed
}
