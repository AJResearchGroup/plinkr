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
#'   assoc_qt(
#'     assoc_qt_data = create_demo_assoc_qt_data(),
#'     assoc_qt_params = create_test_assoc_qt_params()
#'   )
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
assoc_qt_on_plink_bin_data <- function(
  assoc_qt_data,
  assoc_qt_params,
  plink_options = create_plink_options(),
  verbose = FALSE
) {
  plinkr::check_assoc_qt_data(assoc_qt_data)
  plinkr::check_assoc_qt_params(assoc_qt_params)
  plinkr::check_plink_options(plink_options)
  plinkr::check_verbose(verbose)
  plinkr::check_plink_version_and_data_can_work_together(
    data = assoc_qt_data$data,
    plink_options = plink_options
  )

  if (!plinkr::is_plink_bin_data(assoc_qt_data$data)) {
    stop(
      "'assoc_qt_params' is not PLINK binary data. \n",
      "Tip 1: use 'assoc_qt' to let plinkr detect the type of PLINK data. \n",
      "Tip 2: If the data is in PLINK text format, ",
      "use 'assoc_qt_on_plink_text_data'. \n",
      "Tip 3: If the data is in PLINK2 binary format, ",
      "use 'assoc_qt_on_plink2_bin_data'. \n"
    )
  }

  # Filenames
  base_input_filename <- assoc_qt_params$base_input_filename
  bed_filename <- paste0(base_input_filename, ".bed")
  bim_filename <- paste0(base_input_filename, ".bim")
  fam_filename <- paste0(base_input_filename, ".fam")
  phe_filename <- paste0(base_input_filename, ".phe")
  log_filename <- paste0(assoc_qt_params$base_output_filename, ".log")

  # 'save_' functions will check for success themselves
  assoc_qt_data$data <- save_plink_bin_data(
    plink_bin_data = assoc_qt_data$data,
    base_input_filename = assoc_qt_params$base_input_filename
  )

  assoc_qt_result <- plinkr::assoc_qt_on_plink_bin_files(
    assoc_qt_data = assoc_qt_data,
    assoc_qt_params = assoc_qt_params,
    plink_options = plink_options,
    verbose = verbose
  )

  qassoc_filenames <- assoc_qt_result$qassoc_filenames
  log_filename <- assoc_qt_result$log
  qassoc_table <- plinkr::read_plink_qassoc_files(
    qassoc_filenames = qassoc_filenames
  )
  log <- plinkr::read_plink_log_file(log_filename)

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

  assoc_qt_result <- list(
    qassoc_table = qassoc_table,
    log = log
  )
  plinkr::check_assoc_qt_result(assoc_qt_result)
  assoc_qt_result
}
