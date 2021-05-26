#' Get the text of the PLINK help file
#' @inheritParams default_params_doc
#' @return the text of the PLINK help file
#' @author Richèl J.C. Bilderbeek
#' @export
get_plink_help_text <- function(
  plink_version = get_default_plink_version(),
  plink_folder = get_plink_folder()
) {
  plinkr::run_plink(
    args = "--help",
    plink_version = plink_version,
    plink_folder = plink_folder
  )
}
