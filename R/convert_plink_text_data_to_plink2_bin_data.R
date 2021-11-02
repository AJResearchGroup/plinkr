
#' Convert the `PLINK` text data to `PLINK` binary data
#'
#' Convert the `PLINK` text data to `PLINK` binary data.
#' @inheritParams default_params_doc
#' @return the same \link{list} that was used as input,
#' except that the following elements
#'
#'  * `ped_table` (see \link{check_ped_table})
#'  * `map_table` (see \link{check_map_table})
#'
#' are replaced by:
#'
#'  * `pgen_table` (see \link{check_pgen_table})
#'  * `psam_table` (see \link{check_psam_table})
#'  * `pvar_table` (see \link{check_pvar_table})
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
#' @author Richèl J.C. Bilderbeek
#' @export
convert_plink_text_data_to_plink2_bin_data <- function( # nolint indeed a long function name
  plink_text_data,
  base_output_plink1_filename = plinkr::get_plinkr_tempfilename(fileext = ""),
  base_output_plink2_filename = plinkr::get_plinkr_tempfilename(fileext = ""),
  plink1_options = create_plink_v1_9_options(),
  plink2_options = create_plink_v2_0_options(),
  verbose = FALSE
) {
  plinkr::check_plink_options(plink1_options)
  plinkr::check_plink_options(plink2_options)

  if (plink1_options$plink_version %in% plinkr::get_plink2_versions()) {
    stop(
      "PLINK2 cannot convert '.map' and '.ped' files. ",
      "Use PLINK v1.7 or v1.9 instead. ",
      "Tip: use 'plink1_options = create_plink_v1_9_options()'"
    )
  }
  if (plink2_options$plink_version %in% plinkr::get_plink1_versions()) {
    stop(
      "PLINK cannot convert '.bed', '.bim' and '.fam' files. ",
      "Use PLINK v2.0 instead. ",
      "Tip: use 'plink2_options = create_plink_v2_0_options()'"
    )
  }
  # Copy
  plink_bin_data <- plinkr::convert_plink_text_data_to_plink_bin_data(
    plink_text_data = plink_text_data,
    plink_options = plink1_options,
    verbose = verbose
  )

  plinkr::convert_plink_bin_data_to_plink2_bin_data(
    plink_bin_data = plink_bin_data,
    plink_options = plink2_options,
    verbose = verbose
  )
}
