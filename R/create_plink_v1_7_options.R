#' Create the options to run PLINK v1.7
#'
#' Create the options to run PLINK v1.7
#' @inheritParams default_params_doc
#' @return the PLINK options,
#' as can be checked by \link{check_plink_options}
#' @examples
#' create_plink_v1_7_options()
#' @author Richèl J.C. Bilderbeek
#' @export
create_plink_v1_7_options <- function(
  plink_folder = get_plink_folder(),
  os = get_os()
) {
  plinkr::create_plink_options(
    plink_version = "1.7",
    plink_folder = plink_folder,
    os = os
  )
}
