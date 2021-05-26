#' Get the path to a plinkr file
#' @inheritParams default_params_doc
#' @return the path to a plinkr file, if it exists.
#'   Will \link{stop} if the file does not exist
#' @examples
#' get_plinkr_filename("plink.log")
#' @author Richèl J.C. Bilderbeek
#' @export
get_plinkr_filename <- function(
  example_filename
) {
  full_path <- system.file("extdata", example_filename, package = "plinkr")
  if (!file.exists(full_path)) {
    stop(
      "'filename' must be the name of a file in 'inst/extdata'. \n",
      "Tip: use:\n",
      " \n",
      "plinkr::get_plinkr_filenames() \n",
      " \n",
      "to get a list of all plinkr files \n"
    )
  }
  full_path
}
