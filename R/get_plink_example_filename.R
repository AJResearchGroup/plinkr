#' Get the path to a PLINK example file
#' @inheritParams default_params_doc
#' @return the path to a PLINK example file, if it exists.
#'   Will \link{stop} if the file does not exist
#' @examples
#' if (is_plink_installed()) {
#'   get_plink_example_filename("toy.map")
#'   get_plink_example_filename("toy.ped")
#' }
#'
#' # v.17
#' plink_options <- create_plink_v1_7_options()
#' if (is_plink_installed(plink_options)) {
#'   get_plink_example_filename("test.map", plink_options)
#'   get_plink_example_filename("test.ped", plink_options)
#' }
#'
#' # v1.9
#' plink_options <- create_plink_v1_9_options()
#' if (is_plink_installed(plink_options)) {
#'   get_plink_example_filename("toy.map", plink_options)
#'   get_plink_example_filename("toy.ped", plink_options)
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
get_plink_example_filename <- function(
  example_filename,
  plink_options = create_plink_options()
) {
  plinkr::check_plink_is_installed(plink_options)
  full_path <- file.path(
    dirname(plink_options$plink_exe_path),
    example_filename
  )
  if (!file.exists(full_path)) {
    stop(
      "Example file '", example_filename, "' not found. ",
      "Full path: ", full_path
    )
  }
  full_path
}
