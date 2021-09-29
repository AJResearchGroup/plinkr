#' Convert the `PLINK` binary data to `PLINK2` binary data
#'
#' Convert the `PLINK` binary data to `PLINK2` binary data
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
#' @examples
#' if (is_plink_installed(plink_options = create_plink_v1_9_options())) {
#'   convert_plink_text_data_to_plink_bin_data(
#'     plink_text_data = create_test_plink_text_data()
#'   )
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
convert_plink_bin_data_to_plink2_bin_data <- function( # nolint indeed a long function name
  plink_bin_data,
  plink_options = create_plink_v2_0_options(),
  verbose = FALSE
) {
  plinkr::check_plink_bin_data(plink_bin_data)
  plinkr::check_plink_options(plink_options)

  if (plink_options$plink_version %in% get_plink1_versions()) {
    stop(
      "PLINK cannot convert '.bed', '.bim' and '.fam' files ",
      "to PLINK2 format ('.pgen', '.psam', '.pvar')",
      "Use PLINK2 v2.0 instead. "
    )
  }
  # Copy
  plink2_bin_data <- plink_bin_data
  plink2_bin_data$bed_table <- NULL
  plink2_bin_data$bim_table <- NULL
  plink2_bin_data$fam_table <- NULL

  # Save PLINK1 binary files to temp folder
  base_input_filename <- plinkr::get_plinkr_tempfilename(fileext = "")
  bed_filename <- paste0(base_input_filename, ".bed")
  bim_filename <- paste0(base_input_filename, ".bim")
  fam_filename <- paste0(base_input_filename, ".fam")
  plinkr::save_bed_table(
    bed_filename = bed_filename,
    bed_table = plink_bin_data$bed_table
  )
  plinkr::save_bim_table(
    bim_filename = bim_filename,
    bim_table = plink_bin_data$bim_table
  )
  plinkr::save_fam_table(
    fam_filename = fam_filename,
    fam_table = plink_bin_data$fam_table
  )

  # Convert to PLINK1 binary format
  base_output_filename <- plinkr::get_plinkr_tempfilename(fileext = "")
  testthat::expect_true(base_input_filename != base_output_filename)
  plink2_bin_filenames <- plinkr::convert_plink_bin_files_to_plink2_bin_files(
    base_input_filename = base_input_filename,
    base_output_filename = base_output_filename,
    plink_options = plink_options,
    verbose = verbose
  )
  # Already remove PLINK1 bin files
  file.remove(bed_filename)
  file.remove(bim_filename)
  file.remove(fam_filename)

  # Add PLINK2 binary files to list
  plink2_bin_data$pgen_table <- plinkr::read_plink2_pgen_file(
    pgen_filename = plink2_bin_filenames$pgen_filename,
    verbose = verbose
  )
  plink2_bin_data$psam_table <- plinkr::read_plink2_psam_file(
    psam_filename = plink2_bin_filenames$psam_filename
  )
  plink2_bin_data$pvar_table <- plinkr::read_plink2_pvar_file(
    pvar_filename = plink2_bin_filenames$pvar_filename
  )

  # Delete PLINK2 binary files
  file.remove(plink2_bin_filenames$pgen_filename)
  file.remove(plink2_bin_filenames$psam_filename)
  file.remove(plink2_bin_filenames$pvar_filename)
  file.remove(plink2_bin_filenames$log_filename)

  plink2_bin_data
}
