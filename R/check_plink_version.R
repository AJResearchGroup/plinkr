#' Check if the PLINK version is valid, will stop if not
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @examples
#' check_plink_version("1.7")
#' check_plink_version("1.9")
#' check_plink_version("2.0")
#' check_plink_version("custom")
#' @export
check_plink_version <- function(plink_version) {
  if (length(plink_version) != 1) {
    stop(
      "'plink_version' must have one element \n",
      "length(plink_version): ", length(plink_version)
    )
  }
  plink_versions <- c("1.7", "1.9", "2.0", "custom")
  if (!plink_version %in% plink_versions) {
    stop(
      "Invalid 'plink_version'. \n",
      "Actual value: ", plink_version, " \n",
      "Valid values: ", paste0(plink_versions, collapse = " ")
    )
  }
}
