#' Get the path to the default \code{PLINK} executable as used by \code{plinkr}
#'
#' Get the path to the default \code{PLINK} executable as used by \code{plinkr}.
#' Will give an error for a custom \code{PLINK} version,
#' as set up by \link{create_custom_plink_options}, as a custom install
#' requires no zip file
#' @inheritParams default_params_doc
#' @return path to the default \code{PLINK} executable  as used by \code{plinkr}
#' @examples
#' get_plink_zip_path(create_plink_v1_7_options())
#' get_plink_zip_path(create_plink_v1_9_options())
#' @author Richèl J.C. Bilderbeek
#' @export
get_plink_zip_path <- function(
  plink_options = create_plink_options()
) {
  plinkr::check_plink_options(plink_options)
  if (plink_options$plink_version == "custom") {
    stop("A custom PLINK installation has no default zip path")
  }
  plink_version_str <- stringr::str_replace(
    plink_options$plink_version,
    pattern = "\\.",
    replacement = "_"
  )
  file.path(
    dirname(dirname(plink_options$plink_exe_path)),
    paste0("plink_", plink_version_str, ".zip")
  )
}
