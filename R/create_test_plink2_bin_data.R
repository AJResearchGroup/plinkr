#' Create a set of `PLINK2` binary data to be used in testing
#' @examples
#' create_test_plink2_bin_data()
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_plink2_bin_data <- function(
  pgen_table = get_test_pgen_table(),
  psam_table = get_test_psam_table(),
  pvar_table = get_test_pvar_table()
) {
  plinkr::create_plink2_bin_data(
    pgen_table = pgen_table,
    psam_table = psam_table,
    pvar_table = pvar_table
  )
}
