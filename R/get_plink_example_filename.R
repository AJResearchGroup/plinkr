#' Get the path to a PLINK example file
#' @inheritParams default_params_doc
#' @param example_filename name of the example file
#' @return the path to a PLINK example file, if it exists.
#'   Will \link{stop} if the file does not exist
#' @export
#' @examples
#' if (is_plink_installed()) {
#'   get_plink_example_filename("test.map")
#'   get_plink_example_filename("test.ped")
#' }
get_plink_example_filename <- function(
  example_filename,
  plink_folder = get_plink_folder()
) {
  check_plink_is_installed(plink_folder = plink_folder)
  full_path <- file.path(
    dirname(get_plink_exe_path(plink_folder = plink_folder)),
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
