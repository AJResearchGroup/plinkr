#' Get the path to the default PLINK executable as used by plinkr
#' @inheritParams default_params_doc
#' @return path to the default PLINK executable  as used by plinkr
#' @author Richèl J.C. Bilderbeek
#' @export
get_plink_exe_path <- function(
  plink_options = create_plink_options()
) {
  plinkr::check_plink_options(plink_options)

  if (plink_options$plink_version == "custom") {
    return(
      file.path(
        plink_options$plink_folder,
        "plink"
      )
    )
  }

  # Don't be smart yet
  plink_version <- plink_options$plink_version
  plink_folder <- plink_options$plink_folder

  plink_subfolder <- plinkr::get_plink_subfolder(plink_options)
  exe_name <- NA
  if (plink_version == "1.7") {
    exe_name <- "plink"
  }
  else if (plink_version == "1.9") {
    exe_name <- "plink"
  }
  else {
    testthat::expect_equal(plink_version, "2.0")
    exe_name <- "plink2"
  }
  testthat::expect_false(is.na(exe_name))
  if (plink_options$os == "win") exe_name <- paste0(exe_name, ".exe")

  file.path(
    plink_folder,
    plink_subfolder,
    exe_name
  )
}
