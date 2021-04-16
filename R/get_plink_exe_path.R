#' Get the path to the default PLINK executable as used by plinkr
#' @inheritParams default_params_doc
#' @return path to the default PLINK executable  as used by plinkr
#' @export
get_plink_exe_path <- function(
  plink_folder = get_plink_folder()
) {
  file.path(
    plink_folder,
    "plink-1.07-x86_64", "plink"
  )
}
