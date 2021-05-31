#' Create the PLINK options for all supported versions of PLINK
#'
#' Create the PLINK options for all supported versions of PLINK.
#' @note 'optionses' is the reduplicated plural (or: Gollumese)
#' of 'options', to indicate this is a list of multiple options
#' @inheritParams default_params_doc
#' @return a list of multiple PLINK options,
#' as can be checked by \link{check_plink_optionses}
#' @examples
#' create_plink_optionses()
#' @author Richèl J.C. Bilderbeek
#' @export
create_plink_optionses <- function(
  plink_folder = get_plink_folder()
) {
  list(
    plinkr::create_plink_v1_7_options(plink_folder),
    plinkr::create_plink_v1_9_options(plink_folder)
  )
}
