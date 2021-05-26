#' Get the version of PLINK
#' @inheritParams default_params_doc
#' @return the version of PLINK
#' @author Richèl J.C. Bilderbeek
#' @export
get_plink_version <- function(
  plink_version = get_default_plink_version(),
  plink_folder = get_plink_folder()
) {
  plinkr::check_plink_version(plink_version)
  plinkr::check_plink_is_installed(
    plink_version = plink_version,
    plink_folder = plink_folder
  )
  text <- plinkr::get_plink_help_text(
    plink_version = plink_version,
    plink_folder = plink_folder
  )
  all_matches <- stringr::str_match(
    string = text,
    pattern = "v[:digit:]+\\.[:digit:]+"
  )
  testthat::expect_equal(1, ncol(all_matches))
  version <- all_matches[!is.na(all_matches)]
  testthat::expect_equal(1, length(version))
  version
}
