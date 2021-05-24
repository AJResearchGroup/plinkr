#' Get the path to the default PLINK executable as used by plinkr
#' @inheritParams default_params_doc
#' @return path to the default PLINK executable  as used by plinkr
#' @export
get_plink_zip_path <- function(
  plink_version = get_default_plink_version(),
  plink_folder = get_plink_folder()
) {
  plinkr::check_plink_version(plink_version)
  if (plink_version == "1.7") {
    return(
      file.path(
        plink_folder,
        "plink_1_7.zip"
      )
    )
  }
  stop("Should never get here in get_plink_zip_path")
}
