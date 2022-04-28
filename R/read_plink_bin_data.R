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
  bim_table <- plinkr::read_plink_bim_file(bim_filename = bim_filename)
  if (verbose) {
    message(
      "number of SNPs in .bim table: ",
      plinkr::get_n_snps_from_bim_table(bim_table)
    )

  }
  fam_table <- plinkr::read_plink_fam_file(fam_filename = fam_filename)
  if (verbose) {
    message(
      "number of samples/individuals in .fam table: ",
      plinkr::get_n_samples_from_fam_table(fam_table)
    )

  }
  bed_table <- plinkr::read_plink_bed_file_from_files(
    bed_filename = bed_filename,
    bim_filename = bim_filename,
    fam_filename = fam_filename,
    verbose = verbose
  )
  if (verbose) {
    message(
      "number of SNPs in .bed table: ",
      plinkr::get_n_snps_from_bed_table(bed_table)
    )
    message(
      "number of samples/individuals in .bed table: ",
      plinkr::get_n_samples_from_bed_table(bed_table)
    )

  }

  # Will be checked there
  plinkr::create_plink_bin_data(
    bim_table = bim_table,
    fam_table = fam_table,
    bed_table = bed_table
  )
}
