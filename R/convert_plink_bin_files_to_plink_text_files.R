#' Convert PLINK binary files to PLINK plain-text files
#' @inheritParams default_params_doc
#' @return the full paths to the `.bed`, `.bim` and `.fam` files created
#' @seealso these are the functions to convert between the `PLINK` and
#' `PLINK2` files:
#'
#'  * To convert from PLINK1 text files
#'    * to PLINK1 binary files:
#'      use \link{convert_plink_text_files_to_plink_bin_files}
#'    * to PLINK2 binary files,
#'      use \link{convert_plink_text_files_to_plink2_bin_files}
#'  * To convert from PLINK1 binary files
#'    * to PLINK text files,
#'      use \link{convert_plink_bin_files_to_plink_text_files}
#'    * to PLINK2 binary files,
#'      use \link{convert_plink_bin_files_to_plink2_bin_files}
#'  * To convert from PLINK2 binary files
#'    * to PLINK text files,
#'      use \link{convert_plink2_bin_files_to_plink_text_files}
#'    * to PLINK binary files,
#'      use \link{convert_plink2_bin_files_to_plink_bin_files}
#' @author Richèl J.C. Bilderbeek
#' @export
convert_plink_bin_files_to_plink_text_files <- function( # nolint indeed a long function name
  base_input_filename,
  base_output_filename,
  plink_options = create_plink_options(),
  verbose = FALSE
) {
  # From https://www.cog-genomics.org/plink/1.9/data#recode
  # plink --bfile binary_fileset --recode --out new_text_fileset

  # Convert to vcf
  # plink --bfile binary_fileset --recode vcf-iid --out new_vcf

  plink_bin_data <- plinkr::read_plink_bin_data(
    base_input_filename = base_input_filename
  )
  stop("Depends on 'convert_plink_bin_data_to_plink_text_data'")
  plink_text_data <- plinkr::convert_plink_bin_data_to_plink_text_data(
    plink_bin_data = plink_bin_data,
    plink_options = plink_options,
    verbose = verbose
  )
  plinkr::save_plink_text_data(
    plink_text_data = plink_text_data,
    base_input_filename = base_output_filename,
    verbose = verbose
  )
}
