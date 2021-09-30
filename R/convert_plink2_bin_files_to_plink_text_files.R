#' Convert `PLINK2` binary data files to `PLINK` text data files
#' @inheritParams default_params_doc
#' @return a list with the following elements:
#'  * `ped_filename`: the full `.ped` filename
#'  * `map_filename`: the full `.map` filename
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
convert_plink2_bin_files_to_plink_text_files <- function( # nolint indeed a long function name
  base_input_filename,
  base_output_filename = file.path(dirname(base_input_filename), "output"),
  plink_options = create_plink_v2_0_options(),
  verbose = FALSE
) {
  stop("TODO")
}
