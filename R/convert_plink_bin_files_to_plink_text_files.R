#' Convert PLINK binary files to PLINK plain-text files
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
#' @export
convert_plink_bin_files_to_plink_text_files <- function( # nolint indeed a long function name
  base_input_filename,
  base_output_filename,
  plink_options = create_plink_options(),
  verbose = FALSE
) {
  stop("Depends on 'convert_plink_bin_data_to_plink_text_data'")
  plink_bin_data <- plinkr::read_plink_bin_data(
    base_input_filename = base_input_filename
  )
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
