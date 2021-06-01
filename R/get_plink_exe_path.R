#' Get the path to the default PLINK executable as used by plinkr
#' @inheritParams default_params_doc
#' @return path to the default PLINK executable  as used by plinkr
#' @author Richèl J.C. Bilderbeek
#' @export
get_plink_exe_path <- function(
  plink_options = create_plink_options()
) {
  plinkr::check_plink_options(plink_options)

  # Don't be smart yet
  plink_version <- plink_options$plink_version
  plink_folder <- plink_options$plink_folder

  if (plink_version == "custom") {
    return(
      file.path(
        plink_folder,
        "plink"
      )
    )
  }

  subfolder <- NA
  if (plink_version == "1.7") {
    subfolder <- "plink-1.07-x86_64"
  }
  else if (plink_version == "1.9") {
    subfolder <- "plink_1_9"
  }
  else {
    testthat::expect_equal(plink_version, "2.0")
    subfolder <- "plink_2_0"
  }
  testthat::expect_false(is.na(subfolder))
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
  file.path(
    plink_folder,
    subfolder,
    exe_name
  )
}
