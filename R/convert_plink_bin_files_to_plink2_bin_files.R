#' Convert `PLINK` binary data files to `PLINK2` binary data files
#' @inheritParams default_params_doc
#' @return a list with the following elements:
#'  * `pgen_filename`: the full `.pgen` filename
#'  * `psam_filename`: the full `.psam` filename
#'  * `pvar_filename`: the full `.pvar` filename
#'  * `log_filename`: the full `.log` filename
#' @author Richèl J.C. Bilderbeek
#' @export
convert_plink_bin_files_to_plink2_bin_files <- function( # nolint indeed a long function name
  base_input_filename,
  base_output_filename = file.path(dirname(base_input_filename), "output"),
  plink_options = create_plink_v2_0_options(),
  verbose = FALSE
) {
  # All input is checked by make_pgen :-)
  plink2_bin_filenames <- plinkr::make_pgen(
    base_input_filename = base_input_filename,
    base_output_filename = base_output_filename,
    plink_options = plink_options,
    verbose = verbose
  )
  pgen_filename <- stringr::str_subset(plink2_bin_filenames, "\\.pgen$")
  psam_filename <- stringr::str_subset(plink2_bin_filenames, "\\.psam$")
  pvar_filename <- stringr::str_subset(plink2_bin_filenames, "\\.pvar$")
  log_filename <- stringr::str_subset(plink2_bin_filenames, "\\.log$")
  testthat::expect_equal(1, length(pgen_filename))
  testthat::expect_equal(1, length(psam_filename))
  testthat::expect_equal(1, length(pvar_filename))
  testthat::expect_equal(1, length(log_filename))
  list(
    pgen_filename = pgen_filename,
    psam_filename = psam_filename,
    pvar_filename = pvar_filename,
    log_filename = log_filename
  )
}
