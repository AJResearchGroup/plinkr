#' Get the path to the default \code{PLINK} subfolder as used by \link{plinkr}
#'
#' Get the path to the default \code{PLINK} subfolder as used by \link{plinkr}.
#'
#' \link{plinkr} installs all versions of \code{PLINK} in
#' a default \code{PLINK} folder,
#' as can be obtained by \link{get_plink_folder}.
#'
#' In that \code{PLINK} folder, there are different subfolders for the
#' different version of \code{PLINK}.
#' The subfolders are named \code{plink_[version]_[os]},
#' where \code{[version]} denotes the \code{PLINK} version (where
#' the periods are replaced by underscores) and \code{[os]}
#' denotes the operating system, as obtained by \link{get_os}.
#' Examples are
#' \code{plink_1_7_unix}, \code{plink_1_9_mac} and \code{plink_2_0_win}.
#' @inheritParams default_params_doc
#' @return path to the default PLINK executable  as used by plinkr
#' @author Richèl J.C. Bilderbeek
#' @export
get_plink_subfolder_name <- function(
  plink_version = get_default_plink_version(),
  os = get_os()
) {
  plinkr::check_plink_version(plink_version)
  if (plink_version == "custom") {
    stop("Cannot predict the PLINK subfolder for a custom PLINK version")
  }

  version_str <- stringr::str_replace_all(
    plink_version,
    "\\.",
    "_"
  )
  paste0("plink_", version_str, "_", os)
}
