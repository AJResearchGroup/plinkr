#' Create a \link{plinkr} report, to be used when reporting bugs
#' @export
plinkr_report <- function() {
  message("OS: ", rappdirs::app_dir()$os)
  for (plink_version in plinkr::get_plink_versions()) {
    message(
      paste0("PLINK version (plink versioning scheme) '",
        plink_version, "' installed: ",
        plinkr::is_plink_installed(plink_version = plink_version)
      )
    )
    if (plinkr::is_plink_installed(plink_version = plink_version)) {
      message(
        paste0(
          "PLINK version (PLINK versioning scheme): ",
          plinkr::get_plink_version(plink_version = plink_version)
        )
      )
    }
  }
  message(paste0(devtools::session_info(), collapse = "\n"))
}
