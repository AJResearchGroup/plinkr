#' Get the URL to download a version of PLINK from
#'
#'  * PLINK v1.9: \url{https://www.cog-genomics.org/plink2/}
#' @inheritParams default_params_doc
#' @return a URL
#' @author Richèl J.C. Bilderbeek
#' @export
get_plink_download_url <- function(
  plink_version = get_default_plink_version(),
  os = get_os()
) {
  plinkr::check_plink_version(plink_version)
  plinkr::check_os(os)
  if (os == "unix") {
    return(plinkr::get_plink_download_url_linux(plink_version))
  } else if (os == "mac") {
    return(plinkr::get_plink_download_url_mac(plink_version))
  } else {
    testthat::expect_equal(os, "win")
    return(plinkr::get_plink_download_url_win(plink_version))
  }
}
