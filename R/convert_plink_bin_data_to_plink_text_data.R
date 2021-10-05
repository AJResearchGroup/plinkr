#' Convert the `PLINK` binary data to `PLINK` text data
#'
#' Convert the `PLINK` binary data to `PLINK` text data
#' @inheritParams default_params_doc
#' @return the same \link{list} that was used as input,
#' except that the following elements
#'
#'  * `bim_table` (see \link{check_bim_table})
#'  * `fam_table` (see \link{check_fam_table})
#'  * `bed_table` (see \link{check_bed_table})
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
convert_plink_bin_data_to_plink_text_data <- function( # nolint indeed a long function name
  plink_bin_data
) {
  plinkr::check_plink_bin_data(plink_bin_data)
  ped_table <- plinkr::convert_bed_and_fam_tables_to_ped_table(
    bed_table = plink_bin_data$bed_table,
    fam_table = plink_bin_data$fam_table
  )
  map_table <- plinkr::convert_bim_table_to_map_table(
    bim_table = plink_bin_data$bim_table
  )
  plinkr::create_plink_text_data(
    ped_table = ped_table,
    map_table = map_table
  )
}
