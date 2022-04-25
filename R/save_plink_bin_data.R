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

  engine <- "genio"
  if (engine == "genio") {
    dir.create(
      dirname(base_input_filename),
      showWarnings = FALSE,
      recursive = TRUE
    )
    attributes(plink_bin_data$bed_table)$plinkr_datatype <- NULL
    colnames(plink_bin_data$bed_table) <- stringr::str_trim(colnames(plink_bin_data$bed_table))
    genio::write_plink(
      file = base_input_filename,
      X = plink_bin_data$bed_table,
      bim = plink_bin_data$bim_table,
      fam = plink_bin_data$fam_table,
      verbose = verbose
    )
  } else {
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
  }
  testthat::expect_true(file.exists(bed_filename))
  testthat::expect_true(file.exists(bim_filename))
  testthat::expect_true(file.exists(fam_filename))
  plinkr::create_plink_bin_filenames(
    bed_filename = bed_filename,
    bim_filename = bim_filename,
    fam_filename = fam_filename
  )
}
