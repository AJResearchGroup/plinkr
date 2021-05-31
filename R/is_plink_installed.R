#' Determine if \code{PLINK} is installed
#' @inheritParams default_params_doc
#' @return \code{TRUE} if \code{PLINK} is installed, \code{FALSE} otherwise
#' @author Richèl J.C. Bilderbeek
#' @export
is_plink_installed <- function(
  plink_options = create_plink_options()
) {
  plinkr::check_plink_options(plink_options)
  is_installed <- FALSE
  tryCatch({
    plinkr::check_plink_is_installed(plink_options)
    is_installed <- TRUE
  }, error = function(e) {} # nolint indeed ignore error message
  )
  is_installed
}
