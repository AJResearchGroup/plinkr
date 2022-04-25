#' Create a set of `PLINK2` binary data to be used in testing
#' @inheritParams default_params_doc
#' @examples
#' create_test_plink2_bin_data()
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_plink2_bin_data <- function(
  pgen_table = get_test_pgen_table(),
  psam_table = get_test_psam_table(),
  pvar_table = get_test_pvar_table()
) {
  pgen_table <- read_plink2_pgen_file_from_files(
    pgen_filename = get_plinkr_filename(
      "toy_v1_9_after_make-bed_after_make-pgen.pgen"
    ),
    psam_filename = get_plinkr_filename(
      "toy_v1_9_after_make-bed_after_make-pgen.psam"
    ),
    pvar_filename = get_plinkr_filename(
      "toy_v1_9_after_make-bed_after_make-pgen.pvar"
    )
  )
  psam_table <- plinkr::read_plink2_psam_file(
    psam_filename = get_plinkr_filename(
      "toy_v1_9_after_make-bed_after_make-pgen.psam"
    )
  )
  pvar_table <- read_plink2_pvar_file(
    pvar_filename = get_plinkr_filename(
      "toy_v1_9_after_make-bed_after_make-pgen.pvar"
    )
  )
  plinkr::create_plink2_bin_data(
    pgen_table = pgen_table,
    psam_table = psam_table,
    pvar_table = pvar_table
  )
}
