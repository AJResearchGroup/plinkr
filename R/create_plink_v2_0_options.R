#' Create the options to run PLINK v2.0
#'
#' Create the options to run PLINK v2.0
#' @inheritParams default_params_doc
#' @return the PLINK options,
#' as can be checked by \link{check_plink_options}
#' @examples
#' create_plink_v2_0_options()
#' @author Richèl J.C. Bilderbeek
#' @export
create_plink_v2_0_options <- function(
  plink_folder = get_plink_folder()
) {
  plinkr::create_plink_options(
    plink_version = "2.0",
    plink_folder = plink_folder
  )
}
