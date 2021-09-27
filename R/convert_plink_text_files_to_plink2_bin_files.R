#' Convert `PLINK` text data files to `PLINK2` binary data files
#'
#' Convert `PLINK` text data files to `PLINK2` binary data files, by
#'
#'   1. convert `PLINK` text data files to `PLINK` binary data files,
#'      using \link{convert_plink_text_files_to_plink_bin_files},
#'      with `base_output_plink1_filename` as a temporary folder
#'      and `plink1_options` as the PLINK version
#'   2. convert `PLINK` binary data files to `PLINK2` binary data files,
#'      using \link{convert_plink_bin_files_to_plink2_bin_files}
#'      with `base_output_plink2_filename` as a temporary folder
#'      and `plink2_options` as the PLINK2 version
#'
#' @inheritParams default_params_doc
#' @return a list with the following elements:
#'  * `pgen_filename`: the full `.pgen` filename
#'  * `psam_filename`: the full `.psam` filename
#'  * `pvar_filename`: the full `.pvar` filename
#'  * `log_filename`: the full `.log` filename
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
convert_plink_text_files_to_plink2_bin_files <- function( # nolint indeed a long function name
  base_input_filename,
  base_output_plink1_filename = file.path(
    dirname(base_input_filename), "output_plink1"
  ),
  base_output_plink2_filename = file.path(
    dirname(base_input_filename), "output_plink2"
  ),
  plink1_options = create_plink_v1_9_options(),
  plink2_options = create_plink_v2_0_options(),
  verbose = FALSE
) {
  plinkr::convert_plink_text_files_to_plink_bin_files(
    base_input_filename = base_input_filename,
    base_output_filename = base_output_plink1_filename,
    plink_options = plink1_options,
    verbose = verbose

  )
  plinkr::convert_plink_bin_files_to_plink2_bin_files(
    base_input_filename = base_output_plink1_filename,
    base_output_filename = base_output_plink2_filename,
    plink_options = plink2_options,
    verbose = verbose
  )
}
