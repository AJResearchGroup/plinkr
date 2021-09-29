#' Save `PLINK` binary data to files.
#'
#' Save `PLINK` binary data to files.
#' @inheritParams default_params_doc
#' @return the full paths to the `.bed`, `.bim` and `.fam` files created
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
  plinkr::save_bim_table(
    bim_table = bim_table,
    bim_filename = bim_filename
  )
  plinkr::save_fam_table(
    fam_table = fam_table,
    fam_filename = fam_filename
  )
  c(
    bed_filename,
    bim_filename,
    fam_filename
  )
}
