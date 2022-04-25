#' Read `PLINK` binary files based on a shared base input filename
#'
#' Read `PLINK` binary files based on a shared base input filename
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
read_plink_bin_data <- function(
  base_input_filename,
  verbose = FALSE
) {
  bed_filename <- paste0(base_input_filename, ".bed")
  bim_filename <- paste0(base_input_filename, ".bim")
  fam_filename <- paste0(base_input_filename, ".fam")
  testthat::expect_true(file.exists(bed_filename))
  testthat::expect_true(file.exists(bim_filename))
  testthat::expect_true(file.exists(fam_filename))
  bed_table <- plinkr::read_plink_bed_file_from_files(
    bed_filename = bed_filename,
    bim_filename = bim_filename,
    fam_filename = fam_filename,
    verbose = verbose
  )
  bim_table <- plinkr::read_plink_bim_file(bim_filename = bim_filename)
  fam_table <- plinkr::read_plink_fam_file(fam_filename = fam_filename)

  # Will be checked there
  plinkr::create_plink_bin_data(
    bim_table = bim_table,
    fam_table = fam_table,
    bed_table = bed_table
  )
}
