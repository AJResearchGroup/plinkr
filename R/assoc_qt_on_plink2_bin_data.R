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
  if (!plinkr::is_plink2_bin_data(assoc_qt_params$data)) {
    stop(
      "'assoc_qt_params' is not PLINK2 binary data. \n",
      "Tip 1: use 'assoc_qt' to let plinkr detect the type of PLINK data. \n",
      "Tip 2: If the data is in PLINK text format, ",
      "use 'assoc_qt_on_plink_text_data'. \n",
      "Tip 3: If the data is in PLINK binary format, ",
      "use 'assoc_qt_on_plink_bin_data'. \n"
    )
  }
  if (plink_options$plink_version %in% plinkr::get_plink1_versions()) {
    stop(
      "PLINK cannot work with PLINK2 binary data. ",
      "Tip: use 'plink_options = create_plink_v2_0_options()' to use PLINK2"
    )
  }

  # Do not be smart yet
  pgen_table <- assoc_qt_params$data$pgen_table
  psam_table <- assoc_qt_params$data$psam_table
  pvar_table <- assoc_qt_params$data$pvar_table
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

  # 'save_' functions will check for success themselves
  plinkr::save_pgen_table_to_file(
    pgen_table = pgen_table,
    pgen_filename = pgen_filename
  )
  plinkr::save_psam_table_to_file(
    psam_table = psam_table,
    psam_filename = psam_filename
  )
  plinkr::save_pvar_table_to_file(
    pvar_table = pvar_table,
    pvar_filename = pvar_filename
  )
  plinkr::save_phe_table_to_file(
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
