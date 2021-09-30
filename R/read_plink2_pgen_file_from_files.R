#' Read a `PLINK2` `.pgen` file
#' using a `.psam` and `.pvar` file.
#'
#' Read a `PLINK2` `.pgen` file
#' using a `.psam` and `.pvar` file.
#' These two accessory files are used to extract the names
#' of the individuals and the names of the loci.
#' Use \link{read_plink2_pgen_file} to read a `.pgen` file
#' without those two accessory files.
#' @inheritParams default_params_doc
#' @examples
#' read_plink2_pgen_file_from_files(
#'   pgen_filename = get_plinkr_filename(
#'     "toy_v1_9_after_make-bed_after_make-pgen.pgen"
#'   ),
#'   psam_filename = get_plinkr_filename(
#'     "toy_v1_9_after_make-bed_after_make-pgen.psam"
#'   ),
#'   pvar_filename = get_plinkr_filename(
#'     "toy_v1_9_after_make-bed_after_make-pgen.pvar"
#'   )
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
read_plink2_pgen_file_from_files <- function( # nolint indeed a long functio name
  pgen_filename,
  psam_filename,
  pvar_filename,
  verbose = FALSE
) {
  testthat::expect_true(file.exists(pgen_filename))
  testthat::expect_true(file.exists(psam_filename))
  testthat::expect_true(file.exists(pvar_filename))
  psam_table <- plinkr::read_plink2_psam_file(psam_filename)
  pvar_table <- plinkr::read_plink2_pvar_file(pvar_filename)
  snp_names <- pvar_table$ID # nolint PLINK2 variable name
  individual_ids <- psam_table$FID # nolint PLINK2 variable name
  plinkr::read_plink2_pgen_file(
    pgen_filename = pgen_filename,
    names_loci = snp_names,
    names_ind = individual_ids,
    verbose = verbose
  )
}
