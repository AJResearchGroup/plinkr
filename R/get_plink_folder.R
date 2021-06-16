#' Get the path to the default \code{PLINK} folder as used by \link{plinkr}
#'
#' Get the path to the default \code{PLINK} folder as used by \link{plinkr}.
#' This is the folder where all \code{PLINK} versions are installed.
#'
#' Use \link{get_plinkr_folder} to get the folder where \link{plinkr}
#' stores its temporary files
#' @return path to the default \code{PLINK} folder as used by \link{plinkr}
#' @author Richèl J.C. Bilderbeek
#' @export
get_plink_folder <- function() {
  rappdirs::user_data_dir(appname = "plinkr")
}
