#' Save `PLINK2` binary data to files.
#'
#' Save `PLINK2` binary data to files.
#' @inheritParams default_params_doc
#' @return a `plink2_bin_filenames`, which is list with the following elements:
#'
#'  * `pgen_filename`: full paths to the `.pgen` created
#'  * `psam_filename`: full paths to the `.psam` created
#'  * `pvar_filename`: full paths to the `.pvar` created
#'
#' @seealso to save `PLINK`/`PLINK2` data use:
#'
#'  * \link{save_plink_text_data}: to save `PLINK` text data
#'  * \link{save_plink_bin_data}: to save `PLINK` binary data
#'  * \link{save_plink2_bin_data}: to save `PLINK2` binary data
#'
#' @author Richèl J.C. Bilderbeek
#' @export
save_plink2_bin_data <- function(
  plink2_bin_data,
  base_input_filename = get_plinkr_tempfilename(),
  plink_options = create_plink_v2_0_options(),
  verbose = FALSE
) {
  plinkr::check_plink2_bin_data(plink2_bin_data)
  plinkr::check_base_input_filename(base_input_filename)
  plinkr::check_verbose(verbose)
  plinkr::check_plink_is_installed(plink_options = plink_options)

  # PLINK2 files to be created
  pgen_filename <- paste0(base_input_filename, ".pgen")
  psam_filename <- paste0(base_input_filename, ".psam")
  pvar_filename <- paste0(base_input_filename, ".pvar")

  if (1 == 2) {
    # This is what one wants to write,
    # but it fails as 'save_pgen_table' does not exist,
    # due to an absent feature in 'pgenlibr', which was requested at
    # https://github.com/chrchang/plink-ng/issues/194
    # Do not be smart yet
    pgen_table <- plink2_bin_data$pgen_table
    psam_table <- plink2_bin_data$psam_table
    pvar_table <- plink2_bin_data$pvar_table

    # 'save_' functions will check for success themselves
    plinkr::save_pgen_table(
      pgen_table = pgen_table,
      pgen_filename = pgen_filename
    )
    plinkr::save_psam_table(
      psam_table = psam_table,
      psam_filename = psam_filename
    )
    plinkr::save_pvar_table(
      pvar_table = pvar_table,
      pvar_filename = pvar_filename
    )
  } else {
    # This is a workaround:
    #   1. convert the data to PLINK1 binary data
    #   2. save the PLINK1 binary data to file
    #   3. make PLINK2 convert the PLINK1 binary files to PLINK2 binary files
    plink_bin_data <- plinkr::convert_plink2_bin_data_to_plink_bin_data(
      plink2_bin_data
    )
    testthat::expect_true(plinkr::is_plink_bin_data(plink_bin_data))
    plink_bin_filenames <- plinkr::save_plink_bin_data(
      plink_bin_data = plink_bin_data,
      base_input_filename = base_input_filename
    )
    plinkr::read_plink_bed_file_from_files(
      bed_filename = plink_bin_filenames$bed_filename,
      bim_filename = plink_bin_filenames$bim_filename,
      fam_filename = plink_bin_filenames$fam_filename
    )
    testthat::expect_true(plinkr::has_plink_bin_files(base_input_filename))
    plinkr::make_pgen(
      base_input_filename = base_input_filename,
      base_output_filename = base_input_filename,
      plink_options = plink_options,
      verbose = verbose
    )
  }
  testthat::expect_true(file.exists(pgen_filename))
  testthat::expect_true(file.exists(psam_filename))
  testthat::expect_true(file.exists(pvar_filename))
  plink2_bin_filenames <- list(
    pgen_filename = pgen_filename,
    psam_filename = psam_filename,
    pvar_filename = pvar_filename
  )
  plinkr::check_plink2_bin_filenames(plink2_bin_filenames)
  plink2_bin_filenames
}
