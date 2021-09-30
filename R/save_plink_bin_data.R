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
    bim_table = plink_bin_data$bim_table,
    bim_filename = bim_filename
  )
  plinkr::save_fam_table(
    fam_table = plink_bin_data$fam_table,
    fam_filename = fam_filename
  )
  if (1 == 1) {
    # Check if the saved files can be read as well
    # Cannot use expect silent
    tryCatch(
      {
        plinkr::check_plink_bed_file_from_files(
          bed_filename = bed_filename,
          bim_filename = bim_filename,
          fam_filename = fam_filename
        )
      }, error = function(e) {
        saveRDS(plink_bin_data$bed_table, "~/bad_bed_table.RDS")
        stop(
          "Cannot read freshly saved .bed file. ",
          "bed_filename: ", bed_filename, " \n",
          "bim_filename: ", bim_filename, " \n",
          "fam_filename: ", fam_filename, " \n",
          " \n",
          "bed_table: \n\n", plink_bin_data$bed_table,
          "knitr::kable(bed_table): \n\n", knitr::kable(plink_bin_data$bed_table)
        )
      }
    )
    plinkr::read_plink_bim_file(bim_filename = bim_filename)
    plinkr::read_plink_fam_file(fam_filename = fam_filename)
  }

  c(
    bed_filename,
    bim_filename,
    fam_filename
  )
}
