#' Get the full paths to all PLINK example files
#' @inheritParams default_params_doc
#' @return the full paths to all PLINK example files
#' @export
#' @examples
#' if (is_plink_installed()) {
#'   get_plink_example_filenames()
#' }
get_plink_example_filenames <- function(
  plink_version = get_default_plink_version(),
  plink_folder = get_plink_folder()
) {
  plinkr::check_plink_is_installed(
    plink_version = plink_version,
    plink_folder = plink_folder
  )
  list.files(
    dirname(
      plinkr::get_plink_exe_path(
        plink_version = plink_version,
        plink_folder = plink_folder
      )
    ),
    full.names = TRUE
  )
}
