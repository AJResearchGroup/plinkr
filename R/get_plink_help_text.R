#' Get the text of the PLINK help file
#' @inheritParams default_params_doc
#' @return the text of the PLINK help file
#' @export
get_plink_help_text <- function(
  plink_folder = get_plink_folder()
) {
  plinkr::run_plink(
    args = "--help",
    plink_folder = plink_folder
  )
}
