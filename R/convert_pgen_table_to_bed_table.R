#' Convert the `PLINK2` binary data to `PLINK` binary data
#'
#' Convert the `PLINK2` binary data to `PLINK` binary data
#' @inheritParams default_params_doc
#' @return the same \link{list} that was used as input,
#' except that the following elements
#'
#'  * `pgen_table` (see \link{check_pgen_table})
#'  * `psam_table` (see \link{check_psam_table})
#'  * `pvar_table` (see \link{check_pvar_table})
#'
#' are replaced by:
#'
#'  * `bim_table` (see \link{check_bim_table})
#'  * `fam_table` (see \link{check_fam_table})
#'  * `bed_table` (see \link{check_bed_table})
#'
#' The other list elements are left as-is.
#' @seealso these are the functions to convert between the `PLINK` and
#' `PLINK2` formats:
#'
#'  * To convert from PLINK1 text data
#'    * to PLINK1 binary data:
#'      use \link{convert_plink_text_data_to_plink_bin_data}
#'    * to PLINK2 binary data,
#'      use \link{convert_plink_text_data_to_plink2_bin_data}
#'  * To convert from PLINK1 binary data
#'    * to PLINK text data,
#'      use \link{convert_plink_bin_data_to_plink_text_data}
#'    * to PLINK2 binary data,
#'      use \link{convert_plink_bin_data_to_plink2_bin_data}
#'  * To convert from PLINK2 binary data
#'    * to PLINK text data,
#'      use \link{convert_plink2_bin_data_to_plink_text_data}
#'    * to PLINK binary data,
#'      use \link{convert_plink2_bin_data_to_plink_bin_data}
#'
#' @examples
#' if (is_plink_installed(plink_options = create_plink_v2_0_options())) {
#'   convert_plink2_bin_data_to_plink_bin_data(
#'     plink2_bin_data = create_test_plink2_bin_data()
#'   )
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
convert_pgen_table_to_bed_table <- function( # nolint indeed a long function name
  pgen_table,
  verbose = FALSE
) {
  plinkr::check_pgen_table(pgen_table)
  bed_table <- pgen_table
  plinkr::check_bed_table(bed_table)
}
