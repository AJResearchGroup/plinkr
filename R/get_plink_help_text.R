#' Get the text of the PLINK help file
#' @inheritParams default_params_doc
#' @return the text of the PLINK help file
#' @author Richèl J.C. Bilderbeek
#' @examples
#' if (is_plink_installed()) {
#'
#'   # Default version
#'   get_plink_help_text()
#'
#'   # PLINK v1.7
#'   get_plink_help_text(create_plink_v1_7_options())
#'
#'   # PLINK v1.9
#'   get_plink_help_text(create_plink_v1_9_options())
#'
#'   # Custom PLINK version, secretly v1.9
#'   plink_folder <- dirname(create_plink_v1_9_options()$plink_exe_path)
#'   get_plink_help_text(create_custom_plink_options(plink_folder))
#' }
#' @export
get_plink_help_text <- function(
  plink_options = create_plink_options()
) {
  plinkr::run_plink(
    args = "--help",
    plink_options = plink_options
  )
}
