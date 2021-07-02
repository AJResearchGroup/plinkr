#' Read a \code{PLINK}/\code{PLINK2} \code{.bed} file
#' using a \code{.bim} and \code{.fam} file.
#'
#' Read a \code{PLINK}/\code{PLINK2} \code{.bed} file
#' using a \code{.bim} and \code{.fam} file.
#' These two accessory files are used to extract the names
#' of the individuals and the names of the loci.
#' Use \link{read_plink_bed_file} to read a \code{.bed} file
#' without those two accessory files.
#' @inheritParams default_params_doc
#' @examples
#' read_plink_bed_file_from_files(
#'   bed_filename = get_plinkr_filename("demo_assoc.bed"),
#'   bim_filename = get_plinkr_filename("demo_assoc.bim"),
#'   fam_filename = get_plinkr_filename("demo_assoc.fam")
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
read_plink_bed_file_from_files <- function(
  bed_filename,
  bim_filename,
  fam_filename,
  verbose = FALSE
) {
  testthat::expect_true(file.exists(bed_filename))
  testthat::expect_true(file.exists(bim_filename))
  testthat::expect_true(file.exists(fam_filename))
  bim_table <- plinkr::read_plink_bim_file(bim_filename)
  fam_table <- plinkr::read_plink_fam_file(fam_filename)
  snp_names <- bim_table$id
  individual_ids <- format(fam_table$fam, scientific = FALSE)
  if (length(unique(individual_ids)) < length(individual_ids)) {
    individual_ids <- format(fam_table$id, scientific = FALSE)
  }
  testthat::expect_equal(length(unique(individual_ids)), length(individual_ids))
  plinkr::read_plink_bed_file(
    bed_filename = bed_filename,
    names_loci = snp_names,
    names_ind = individual_ids,
    verbose = verbose
  )
}
