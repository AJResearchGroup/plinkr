#' Get the URL to download a version of PLINK from
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
    return(get_plink_download_url_linux(plink_version = plink_version))
  }
}
