#' Get the URL to download a version of PLINK from
#' @inheritParams default_params_doc
#' @export
get_plink_download_url <- function(
  plink_version = get_default_plink_version()
) {
  plinkr::check_plink_version(plink_version)
  if (plink_version == "1.7") {
    return (
      "http://zzz.bwh.harvard.edu/plink/dist/plink-1.07-x86_64.zip"
    )
  }
  if (plink_version == "1.9") {
    return (
      "https://s3.amazonaws.com/plink1-assets/plink_linux_x86_64_20210416.zip"
    )
  }

  stop("Should never get here in get_plink_download_url")
}
