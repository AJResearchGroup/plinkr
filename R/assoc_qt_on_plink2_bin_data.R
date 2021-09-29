#' Let PLINK2 detect an association with one or more quantitative traits
#' with data in PLINK2 binary format.
#'
#' Let PLINK2 detect an association with one or more quantitative traits.
#' with data in PLINK2 binary format.
#' @note This function is named after the \code{--assoc} flag used by PLINK.
#' @inheritParams default_params_doc
#' @return
#' A \link[tibble]{tibble} with the detected associations.
#' The table with have as much rows as the number of SNPs multiplied
#' by the number of traits.
#'
#' @author Richèl J.C. Bilderbeek
#' @export
assoc_qt_on_plink2_bin_data <- function(
  assoc_qt_params,
  plink_options = create_plink_options(),
  verbose = FALSE
) {
  plinkr::check_assoc_qt_params(assoc_qt_params)
  plinkr::check_plink_options(plink_options)
  plinkr::check_verbose(verbose)
  plinkr::check_plink_version_and_data_can_work_together(
    data = assoc_qt_params$data,
    plink_options = plink_options
  )
  testthat::expect_true(plinkr::is_plink2_bin_data(assoc_qt_params$data))

  #
  phe_table <- assoc_qt_params$phe_table
  phenotype_names <- names(assoc_qt_params$phe_table)[c(-1, -2)]

  # Filenames
  base_input_filename <- assoc_qt_params$base_input_filename
  pgen_filename <- paste0(base_input_filename, ".pgen")
  psam_filename <- paste0(base_input_filename, ".psam")
  pvar_filename <- paste0(base_input_filename, ".pvar")
  phe_filename <- paste0(base_input_filename, ".phe")
  qassoc_filenames <- paste0(
    assoc_qt_params$base_output_filename, ".", phenotype_names,
    ".qassoc"
  )
  log_filename <- paste0(assoc_qt_params$base_output_filename, ".log")

  # Save all PLINK2 binary data to file
  if (1 == 2) {
    # This is what one wants to write,
    # but it fails as 'save_pgen_table' does not exist,
    # due to an absent feature in 'pgenlibr', which was requested at
    # https://github.com/chrchang/plink-ng/issues/194
    # Do not be smart yet
    pgen_table <- assoc_qt_params$data$pgen_table
    psam_table <- assoc_qt_params$data$psam_table
    pvar_table <- assoc_qt_params$data$pvar_table

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
      assoc_qt_params$data
    )
    testthat::expect_true(plinkr::is_plink_bin_data(plink_bin_data))
    plinkr::save_plink_bin_data(
      plink_bin_data = plink_bin_data,
      base_input_filename = base_input_filename
    )
    testthat::expect_true(plinkr::has_plink_bin_files(base_input_filename))
    plinkr::make_bed_with_plink2(
      base_input_filename = base_input_filename,
      base_output_filename = base_input_filename,
      plink_options = plink_options,
      verbose = verbose
    )
  }

  testthat::expect_true(file.exists(pgen_filename))
  testthat::expect_true(file.exists(psam_filename))
  testthat::expect_true(file.exists(pvar_filename))
  plinkr::save_phe_table(
    phe_table = phe_table,
    phe_filename = phe_filename
  )

  # PLINK will not do so and will not give an error
  dir.create(
    dirname(assoc_qt_params$base_output_filename),
    showWarnings = FALSE,
    recursive = TRUE
  )

  args <- plinkr::create_assoc_qt_args(
    assoc_qt_params = assoc_qt_params,
    plink_options = plink_options
  )
  plinkr::run_plink(
    args = args,
    plink_options = plink_options,
    verbose = verbose
  )

  qassoc_table <- plinkr::read_plink_qassoc_files(
    qassoc_filenames = qassoc_filenames
  )
  if (verbose) {
    message(paste(plinkr::read_plink_log_file(log_filename), collapse = "\n"))
  }

  file.remove(bed_filename)
  file.remove(bim_filename)
  file.remove(fam_filename)
  file.remove(phe_filename)
  for (qassoc_filename in qassoc_filenames) file.remove(qassoc_filename)
  file.remove(log_filename)
  testthat::expect_equal(
    0,
    length(list.files(pattern = base_input_filename))
  )
  unlink(
    dirname(assoc_qt_params$base_input_filename),
    recursive = TRUE
  )
  unlink(
    dirname(assoc_qt_params$base_output_filename),
    recursive = TRUE
  )

  qassoc_table


}
