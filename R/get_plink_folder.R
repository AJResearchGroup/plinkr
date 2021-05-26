#' Get the path to the default PLINK folder as used by plinkr
#' @return path to the default PLINK folder as used by plinkr
#' @author Richèl J.C. Bilderbeek
#' @export
get_plink_folder <- function() {
  rappdirs::user_data_dir(appname = "plinkr")
}
