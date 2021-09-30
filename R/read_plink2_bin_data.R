#' Read `PLINK2` binary files based on a shared base input filename
#'
#' Read `PLINK2` binary files based on a shared base input filename
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
read_plink2_bin_data <- function(
  base_input_filename,
  verbose = FALSE
) {
  pgen_filename <- paste0(base_input_filename, ".pgen")
  psam_filename <- paste0(base_input_filename, ".psam")
  pvar_filename <- paste0(base_input_filename, ".pvar")
  testthat::expect_true(file.exists(pgen_filename))
  testthat::expect_true(file.exists(psam_filename))
  testthat::expect_true(file.exists(pvar_filename))
  pgen_table <- plinkr::read_plink2_pgen_file_from_files(
    pgen_filename = pgen_filename,
    psam_filename = psam_filename,
    pvar_filename = pvar_filename,
    verbose = verbose
  )
  psam_table <- plinkr::read_plink2_psam_file(psam_filename = psam_filename)
  pvar_table <- plinkr::read_plink2_pvar_file(pvar_filename = pvar_filename)

  plinkr::create_plink2_bin_data(
    psam_table = psam_table,
    pvar_table = pvar_table,
    pgen_table = pgen_table
  )
}
