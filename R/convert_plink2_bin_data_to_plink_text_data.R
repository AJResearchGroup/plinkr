
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
#'  * `ped_table` (see \link{check_ped_table})
#'  * `map_table` (see \link{check_map_table})
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
convert_plink2_bin_data_to_plink_text_data <- function( # nolint indeed a long function name
  plink2_bin_data,
  plink_options = create_plink_v2_0_options(),
  verbose = FALSE
) {
  # Input is checked here:
  plink_bin_data <- plinkr::convert_plink2_bin_data_to_plink_bin_data(
    plink2_bin_data = plink2_bin_data,
    plink_options = plink_options,
    verbose = verbose
  )
  plink_text_data <- plinkr::convert_plink_bin_data_to_plink_text_data(
    plink_bin_data = plink_bin_data
  )
  plink_text_data
}
