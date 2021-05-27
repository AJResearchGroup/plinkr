#' Get the path to the default PLINK executable as used by plinkr
#' @inheritParams default_params_doc
#' @return path to the default PLINK executable  as used by plinkr
#' @author Richèl J.C. Bilderbeek
#' @export
get_plink_exe_path <- function(
  plink_version = get_default_plink_version(),
  plink_folder = get_plink_folder()
) {
  plinkr::check_plink_version(plink_version)
  if (plink_version == "1.7") {
    return(
      file.path(
        plink_folder,
        "plink-1.07-x86_64", "plink"
      )
    )
  }
  testthat::expect_true(plink_version == "1.9")
  file.path(
    plink_folder,
    "plink_1_9", "plink"
  )
}
