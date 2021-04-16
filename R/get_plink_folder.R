#' Get the path to the default PLINK folder as used by plinkr
#' @return path to the default PLINK folder as used by plinkr
#' @export
get_plink_folder <- function() {
  rappdirs::user_data_dir(appname = "plinkr")
}
