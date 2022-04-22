#' Save `PLINK` binary data to files.
#'
#' Save `PLINK` binary data to files.
#' @inheritParams default_params_doc
#' @return a `plink_bin_filenames`, which is a \link{list} with elements:
#'
#'  * `bed_filename`: the full path to the `.bed` filename created
#'  * `bim_filename`: the full path to the `.bim` filename created
#'  * `fam_filename`: the full path to the `.fam` filename created
#'
#' @seealso to save `PLINK`/`PLINK2` data use:
#'
#'  * \link{save_plink_text_data}: to save `PLINK` text data
#'  * \link{save_plink_bin_data}: to save `PLINK` binary data
#'  * \link{save_plink2_bin_data}: to save `PLINK2` binary data
#'
#' @author Richèl J.C. Bilderbeek
#' @export
save_plink_bin_data <- function(
  plink_bin_data,
  base_input_filename = get_plinkr_tempfilename(),
  verbose = FALSE
) {
  plinkr::check_plink_bin_data(plink_bin_data)
  plinkr::check_base_input_filename(base_input_filename)
  plinkr::check_verbose(verbose)
  bed_filename <- paste0(base_input_filename, ".bed")
  bim_filename <- paste0(base_input_filename, ".bim")
  fam_filename <- paste0(base_input_filename, ".fam")
  plinkr::save_bed_table(
    bed_table = plink_bin_data$bed_table,
    bed_filename = bed_filename
  )
  testthat::expect_true(file.exists(bed_filename))
  plinkr::save_bim_table(
    bim_table = plink_bin_data$bim_table,
    bim_filename = bim_filename
  )
  plinkr::save_fam_table(
    fam_table = plink_bin_data$fam_table,
    fam_filename = fam_filename
  )
  plinkr::create_plink_bin_filenames(
    bed_filename = bed_filename,
    bim_filename = bim_filename,
    fam_filename = fam_filename
  )
}
