#' Create a set of `PLINK2` binary data
#' @inheritParams default_params_doc
#' @seealso use \link{create_test_plink_bin_data} to create a set
#' of `PLINK` binary data to be used in testing
#' @examples
#' create_plink2_bin_data(
#'   pgen_table = get_test_pgen_table(),
#'   psam_table = get_test_psam_table(),
#'   pvar_table = get_test_pvar_table()
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
create_plink2_bin_data <- function(
  pgen_table,
  psam_table,
  pvar_table
) {
  plinkr::check_pgen_table(pgen_table = pgen_table)
  plinkr::check_psam_table(psam_table = psam_table)
  plinkr::check_pvar_table(pvar_table = pvar_table)
  list(
    pgen_table = pgen_table,
    psam_table = psam_table,
    pvar_table = pvar_table
  )
}
