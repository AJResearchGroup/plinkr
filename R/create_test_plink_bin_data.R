#' Create a set of `PLINK` binary data to be used in testing
#' @inheritParams default_params_doc
#' @examples
#' create_test_plink_bin_data()
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_plink_bin_data <- function(
  bed_table = get_test_bed_table(),
  bim_table = get_test_bim_table(),
  fam_table = get_test_fam_table()
) {
  plinkr::create_plink_bin_data(
    bed_table = bed_table,
    bim_table = bim_table,
    fam_table = fam_table
  )
}
