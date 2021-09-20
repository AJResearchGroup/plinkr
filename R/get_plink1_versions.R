#' Get the supported version of PLINK
#'
#' Get the supported version of PLINK as string.
#'
#' Use \link{create_plink_optionses} to obtain a list
#' of \code{plink_options}.
#' @examples
#' get_plink1_versions()
#' @author Richèl J.C. Bilderbeek
#' @export
get_plink1_versions <- function() {
  c("1.7", "1.9")
}
