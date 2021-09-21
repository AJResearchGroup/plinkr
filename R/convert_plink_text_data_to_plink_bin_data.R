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
#'  * `bim_table` (see \link{check_bim_table})
#'  * `fam_table` (see \link{check_fam_table})
#'  * `bed_table` (see \link{check_bed_table})
#'
#' The other list elements are left as-is.
#' @examples
#' if (is_plink_installed(plink_options = create_plink_v1_9_options())) {
#'   convert_plink_text_data_to_plink_bin_data(
#'     create_test_assoc_qt_params()$data
#'   )
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
convert_plink_text_data_to_plink_bin_data <- function( # nolint indeed a long function name
  plink_text_data,
  plink_options = create_plink_v1_9_options(),
  verbose = FALSE
) {
  # Copy
  plink_bin_data <- plink_text_data
  plink_bin_data$ped_table <- NULL
  plink_bin_data$map_table <- NULL

  # Save PLINK1 text files to temp folder
  base_input_filename <- plinkr::get_plinkr_tempfilename(fileext = "")
  ped_filename <- paste0(base_input_filename, ".ped")
  map_filename <- paste0(base_input_filename, ".map")
  plinkr::save_ped_table_to_file(
    ped_filename = ped_filename,
    ped_table = plink_text_data$ped_table
  )
  plinkr::save_map_table_to_file(
    map_filename = map_filename,
    map_table = plink_text_data$map_table
  )

  # Convert to PLINK1 binary format
  base_output_filename <- plinkr::get_plinkr_tempfilename(fileext = "")
  testthat::expect_true(base_input_filename != base_output_filename)
  plink_bin_filenames <- plinkr::convert_plink_text_files_to_plink_bin_files(
    base_input_filename = base_input_filename,
    base_output_filename = base_output_filename,
    plink_options = plink_options,
    verbose = verbose
  )
  # Already remove PLINK1 text files
  file.remove(ped_filename)
  file.remove(map_filename)

  # Add PLINK1 binary files to list
  plink_bin_data$bim_table <- plinkr::read_plink_bim_file(
    bim_filename = plink_bin_filenames$bim_filename,
    verbose = verbose
  )
  plink_bin_data$fam_table <- plinkr::read_plink_fam_file(
    fam_filename = plink_bin_filenames$fam_filename,
    verbose = verbose
  )
  plink_bin_data$bed_table <- plinkr::read_plink_bed_file(
    bed_filename = plink_bin_filenames$bed_filename,
    names_loci = plink_bin_data$bim_table$id,
    names_ind = plink_bin_data$fam_table$id,
    verbose = verbose
  )

  # Delete PLINK1 binary files
  file.remove(plink_bin_filenames$bed_filename)
  file.remove(plink_bin_filenames$bim_filename)
  file.remove(plink_bin_filenames$fam_filename)
  file.remove(plink_bin_filenames$log_filename)

  plink_bin_data
}
