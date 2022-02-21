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
convert_plink2_bin_data_to_plink_bin_data <- function( # nolint indeed a long function name
  plink2_bin_data,
  plink_options = create_plink_v2_0_options(),
  verbose = FALSE
) {
  plinkr::check_plink2_bin_data(plink2_bin_data)
  plinkr::check_plink_options(plink_options)
  plinkr::check_verbose(verbose)

  if (plink_options$plink_version %in% get_plink1_versions()) {
    stop(
      "PLINK cannot convert PLINK2 ('.pgen', '.psam' and '.pvar') files. \n",
      "Use PLINK2 v2.0 instead. \n",
      " \n",
      "Tip: use 'plink_options = create_plink_v2_0_options()'"
    )
  }
  # Copy
  plink_bin_data <- plink2_bin_data
  plink_bin_data$pgen_table <- NULL
  plink_bin_data$psam_table <- NULL
  plink_bin_data$pvar_table <- NULL

  plink_bin_data$bed_table <- plinkr::convert_pgen_table_to_bed_table(
    pgen_table = plink2_bin_data$pgen_table
  )
  plink_bin_data$bim_table <- plinkr::convert_pvar_table_to_bim_table(
    pvar_table = plink2_bin_data$pvar_table
  )
  plink_bin_data$fam_table <- plinkr::convert_psam_table_to_fam_table(
    psam_table = plink2_bin_data$psam_table
  )
  plinkr::check_plink_bin_data(plink_bin_data)
  plink_bin_data
}
