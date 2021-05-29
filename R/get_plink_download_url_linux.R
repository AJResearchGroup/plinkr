#' Get the URL to download a Linux version of PLINK
#' @inheritParams default_params_doc
#' @return a URL
#' @author Richèl J.C. Bilderbeek
#' @export
get_plink_download_url_linux <- function(
  plink_version = get_default_plink_version()
) {
  plinkr::check_plink_version(plink_version)
  if (plink_version == "1.7") {
    return(
      "http://zzz.bwh.harvard.edu/plink/dist/plink-1.07-x86_64.zip"
    )
  }
  testthat::expect_true(plink_version == "1.9")
  "https://s3.amazonaws.com/plink1-assets/plink_linux_x86_64_20210416.zip"
}
