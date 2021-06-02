#' Get the name of the PLINK executable
#'
#' Get the name of the PLINK executable
#' @inheritParams default_params_doc
#' @return path to the default PLINK executable  as used by plinkr
#' @examples
#' get_plink_exe_name()
#' get_plink_exe_name(plink_version = "2.0")
#' get_plink_exe_name(os = "win")
#' @author Richèl J.C. Bilderbeek
#' @export
get_plink_exe_name <- function(
  plink_version = get_default_plink_version(),
  os = get_os()
) {
  plinkr::check_plink_version(plink_version)
  if (plink_version == "custom") {
    stop("Cannot predict PLINK executable name for a custom version")
  }
  plink_exe_name <- NA
  if (plink_version %in% c("1.7", "1.9")) {
    plink_exe_name <- "plink"
  }
  else {
    testthat::expect_equal(plink_version, "2.0")
    plink_exe_name <- "plink2"
  }
  testthat::expect_false(is.na(plink_exe_name))
  if (os == "win") {
    plink_exe_name <- paste0(plink_exe_name, ".exe")
  }
  plink_exe_name
}
