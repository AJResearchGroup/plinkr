#' Let `PLINK2` detect an association with one or more quantitative traits
#' with data in `PLINK2` binary format.
#'
#' Let `PLINK2` detect an association with one or more quantitative traits
#' with data in `PLINK2` binary format.
#' @seealso use \link{assoc_qt_on_plink2_bin_data} to work on files that
#' already exist.
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
  assoc_qt_data,
  assoc_qt_params,
  plink_options = create_plink_options(),
  verbose = FALSE
) {
  plinkr::check_assoc_qt_params(assoc_qt_params)
  plinkr::check_plink_options(plink_options)
  plinkr::check_verbose(verbose)
  plinkr::check_plink_version_and_data_can_work_together(
    data = assoc_qt_data$data,
    plink_options = plink_options
  )
  testthat::expect_true(plinkr::is_plink2_bin_data(assoc_qt_data$data))

  # Filenames
  base_input_filename <- assoc_qt_params$base_input_filename
  pgen_filename <- paste0(base_input_filename, ".pgen")
  psam_filename <- paste0(base_input_filename, ".psam")
  pvar_filename <- paste0(base_input_filename, ".pvar")
  phe_filename <- paste0(base_input_filename, ".phe")
  log_filename <- paste0(assoc_qt_params$base_output_filename, ".log")

  # Convert data from in-memory to paths
  assoc_qt_data$data <- plinkr::save_plink2_bin_data(
    plink2_bin_data = assoc_qt_data$data,
    base_input_filename = base_input_filename,
    verbose = verbose
  )

  testthat::expect_true(file.exists(pgen_filename))
  testthat::expect_true(file.exists(psam_filename))
  testthat::expect_true(file.exists(pvar_filename))

  assoc_qt_result <- plinkr::assoc_qt_on_plink2_bin_files(
    assoc_qt_data = assoc_qt_data,
    assoc_qt_params = assoc_qt_params,
    plink_options = plink_options,
    verbose = verbose
  )

  qassoc_filenames <- assoc_qt_result$qassoc_filenames
  log_filename <- assoc_qt_result$log_filename

  assoc_qt_result <- list(
    qassoc_table = plinkr::read_plink2_qassoc_files(qassoc_filenames),
    log = plinkr::read_plink_log_file(log_filename)
  )

  file.remove(pgen_filename)
  file.remove(psam_filename)
  file.remove(pvar_filename)
  file.remove(phe_filename)
  for (qassoc_filename in qassoc_filenames) {
    if (file.exists(qassoc_filename)) {
      file.remove(qassoc_filename)
    }
  }
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
  plinkr::check_assoc_qt_result(assoc_qt_result)
  assoc_qt_result
}
