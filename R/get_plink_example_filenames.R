#' Get the full paths to all PLINK example files
#' @inheritParams default_params_doc
#' @return the full paths to all PLINK example files
#' @examples
#' if (is_plink_installed()) {
#'   # Default version
#'   get_plink_example_filenames()
#'
#'   # v1.7
#'   get_plink_example_filenames(create_plink_v1_7_options())
#'
#'   # v1.9
#'   get_plink_example_filenames(create_plink_v1_9_options())
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
get_plink_example_filenames <- function(
  plink_options = create_plink_options()
) {
  plinkr::check_plink_is_installed(plink_options)
  list.files(
    dirname(
      plinkr::get_plink_exe_path(plink_options)
    ),
    full.names = TRUE
  )
}
