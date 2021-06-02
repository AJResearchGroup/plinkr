#' Create the PLINK options for all supported versions of PLINK
#'
#' Create the PLINK options for all supported versions of PLINK.
#' @inheritParams default_params_doc
#' @return a list of multiple PLINK options
#' @examples
#' create_plink_optionses()
#' create_plink_optionses(plink_folder = get_plink_folder())
#' @author Richèl J.C. Bilderbeek
#' @export
create_plink_optionses <- function(
  plink_folder = get_plink_folder()
) {
  list(
    plinkr::create_plink_v1_7_options(plink_folder = plink_folder),
    plinkr::create_plink_v1_9_options(plink_folder = plink_folder),
    plinkr::create_plink_v2_0_options(plink_folder = plink_folder)
  )
}
