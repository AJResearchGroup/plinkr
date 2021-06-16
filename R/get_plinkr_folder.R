#' Get the folder where \link{plinkr} stores its temporary files
#'
#' Get the folder where \link{plinkr} stores its temporary files.
#'
#' Use \link{get_plink_folder} to get the folder where \link{plinkr}
#' stores the versions of PLINK
#' @return path to the default \code{PLINK} folder as used by \link{plinkr}
#' @author Richèl J.C. Bilderbeek
#' @export
get_plinkr_folder <- function() {
  rappdirs::user_cache_dir(appname = "plinkr")
}
