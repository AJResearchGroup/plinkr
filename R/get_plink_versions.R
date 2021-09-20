#' Get the supported version of PLINK and PLINK2
#'
#' Get the supported version of PLINK and PLINK2 as string.
#'
#' Use \link{create_plink_optionses} to obtain a list
#' of \code{plink_options}.
#' @examples
#' get_plink_versions()
#' @author Richèl J.C. Bilderbeek
#' @export
get_plink_versions <- function() {
  c(
    plinkr::get_plink1_versions(),
    plinkr::get_plink2_versions()
  )
}
