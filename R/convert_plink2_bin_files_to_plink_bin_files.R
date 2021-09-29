#' Convert `PLINK` binary data files to `PLINK2` binary data files
#' @inheritParams default_params_doc
#' @return a list with the following elements:
#'  * `bed_filename`: the full `.bed` filename
#'  * `bim_filename`: the full `.bim` filename
#'  * `fam_filename`: the full `.fam` filename
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
convert_plink2_bin_files_to_plink_bin_files <- function( # nolint indeed a long function name
  base_input_filename,
  base_output_filename = file.path(dirname(base_input_filename), "output"),
  plink_options = create_plink_v2_0_options(),
  verbose = FALSE
) {
  # All input is checked by make_pgen :-)
  plink_bin_filenames <- plinkr::make_bed(
    base_input_filename = base_input_filename,
    base_output_filename = base_output_filename,
    plink_options = plink_options,
    verbose = verbose
  )
  bed_filename <- stringr::str_subset(plink_bin_filenames, "\\.bed$")
  bim_filename <- stringr::str_subset(plink_bin_filenames, "\\.bim$")
  fam_filename <- stringr::str_subset(plink_bin_filenames, "\\.fam$")
  log_filename <- stringr::str_subset(plink_bin_filenames, "\\.log$")
  testthat::expect_equal(1, length(bed_filename))
  testthat::expect_equal(1, length(bim_filename))
  testthat::expect_equal(1, length(fam_filename))
  testthat::expect_equal(1, length(log_filename))
  list(
    bed_filename = bed_filename,
    bim_filename = bim_filename,
    fam_filename = fam_filename,
    log_filename = log_filename
  )
}
