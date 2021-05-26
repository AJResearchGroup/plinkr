#' Get the path to a PLINK example file
#' @inheritParams default_params_doc
#' @return the path to a PLINK example file, if it exists.
#'   Will \link{stop} if the file does not exist
#' @export
#' @examples
#' if (is_plink_installed()) {
#'   get_plink_example_filename("toy.map")
#'   get_plink_example_filename("toy.ped")
#' }
#'
#' # Specific versions
#' if (is_plink_installed(plink_version = "1.7")) {
#'   get_plink_example_filename("test.map", plink_version = "1.7")
#'   get_plink_example_filename("test.ped", plink_version = "1.7")
#' }
#' if (is_plink_installed(plink_version = "1.9")) {
#'   get_plink_example_filename("toy.map", plink_version = "1.9")
#'   get_plink_example_filename("toy.ped", plink_version = "1.9")
#' }
get_plink_example_filename <- function(
  example_filename,
  plink_version = get_default_plink_version(),
  plink_folder = get_plink_folder()
) {
  plinkr::check_plink_is_installed(
    plink_version = plink_version,
    plink_folder = plink_folder
  )
  full_path <- file.path(
    dirname(
      plinkr::get_plink_exe_path(
        plink_version = plink_version,
        plink_folder = plink_folder
      )
    ),
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
