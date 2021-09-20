#' Let PLINK detect an association with one or more quantitative traits
#' with data in PLINK binary format.
#'
#' Let PLINK detect an association with one or more quantitative traits.
#' with data in PLINK binary format.
#' @note This function is named after the \code{--assoc} flag used by PLINK.
#' @inheritParams default_params_doc
#' @return
#' A \link[tibble]{tibble} with the detected associations.
#' The table with have as much rows as the number of SNPs multiplied
#' by the number of traits.
#'
#' The \link[tibble]{tibble} has the following columns:
#'
#'   * \code{trait_name}: name of the quantitive trait,
#'     taken from the phenotype table column name
#'   * \code{CHR}: Chromosome number
#'   * \code{SNP}: SNP identifier
#'   * \code{BP}: Physical position (base-pair)
#'   * \code{NMISS}: Number of non-missing genotypes
#'   * \code{BETA}: Regression coefficient
#'   * \code{SE}: Standard error
#'   * \code{R2}: Regression r-squared
#'   * \code{T}: Wald test (based on t-distribution)
#'   * \code{P}: Wald test asymptotic p-value
#'
#' Note that parameters in uppercase are named as such by PLINK.
#' @examples
#' if (is_plink_installed()) {
#'   assoc_qt(create_demo_assoc_qt_params())
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
assoc_qt_on_plink_bin_data <- function(
  assoc_qt_params,
  plink_options = create_plink_options(),
  verbose = FALSE
) {
  plinkr::check_assoc_qt_params(assoc_qt_params)
  plinkr::check_plink_options(plink_options)
  plinkr::check_verbose(verbose)
  if (!plinkr::is_plink_bin_data(assoc_qt_params$data)) {
    stop(
      "'assoc_qt_params' is not PLINK binary data. \n",
      "Tip 1: use 'assoc_qt' to let plinkr detect the type of PLINK data. \n",
      "Tip 2: If the data is in PLINK text format, ",
      "use 'assoc_qt_on_plink_text_data'. \n",
      "Tip 3: If the data is in PLINK2 binary format, ",
      "use 'assoc_qt_on_plink2_bin_data'. \n",
    )
  }

  # Do not be smart yet
  bed_table <- assoc_qt_params$data$bed_table
  bim_table <- assoc_qt_params$data$bim_table
  fam_table <- assoc_qt_params$data$fam_table
  phe_table <- assoc_qt_params$phe_table
  phenotype_names <- names(assoc_qt_params$phe_table)[c(-1, -2)]

  # Filenames
  base_input_filename <- assoc_qt_params$base_input_filename
  bed_filename <- paste0(base_input_filename, ".bed")
  bim_filename <- paste0(base_input_filename, ".bim")
  fam_filename <- paste0(base_input_filename, ".fam")
  phe_filename <- paste0(base_input_filename, ".phe")
  qassoc_filenames <- paste0(
    assoc_qt_params$base_output_filename, ".", phenotype_names,
    ".qassoc"
  )
  log_filename <- paste0(assoc_qt_params$base_output_filename, ".log")

  # 'save_' functions will check for success themselves
  plinkr::save_bed_table_to_file(
    bed_table = bed_table,
    bed_filename = bed_filename
  )
  plinkr::save_bim_table_to_file(
    bim_table = bim_table,
    bim_filename = bim_filename
  )
  plinkr::save_fam_table_to_file(
    fam_table = fam_table,
    fam_filename = fam_filename
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
    verbose = TRUE
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
