#' Install multiple versions of PLINK
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
install_plinks <- function(
  plink_optionses = create_plink_optionses(),
  os = get_os()
) {
  for (plink_options in plink_optionses) {
    plinkr::check_plink_options(plink_options)
    plinkr::install_plink(
      plink_options = plink_options
    )
  }
}
