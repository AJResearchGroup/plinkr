#' Get the current operating system
#' @return the name of the operating system, as returned by
#' \link[rappdirs]{app_dir}
#' @author Richèl J.C. Bilderbeek
#' @examples
#' get_os()
#' @export
get_os <- function() {
  rappdirs::app_dir()$os
}
