#' Let `PLINK2` detect an association with one or more quantitative traits
#' with files in `PLINK2` binary format.
#'
#' Let `PLINK2` detect an association with one or more quantitative traits
#' with files in `PLINK2` binary format.
#' @inheritParams default_params_doc
#' @return a \link{list} with the following elements:
#'
#'  * `qassoc_filenames`: names of the created association files
#'  * `log_filename`: name of the PLINK2 log file
#'
#' @seealso use \link{assoc_qt_on_plink2_bin_data} to work on data directly
#' @note This function is named after the \code{--assoc} flag used by PLINK.
#' @author Richèl J.C. Bilderbeek
#' @export
assoc_qt_on_plink2_bin_files <- function(
  assoc_qt_data,
  assoc_qt_params,
  plink_options = create_plink_v2_0_options(),
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
  testthat::expect_true(plinkr::is_plink2_bin_filenames(assoc_qt_data$data))

  # Filenames
  base_input_filename <- assoc_qt_params$base_input_filename
  pgen_filename <- assoc_qt_data$data$pgen_filename
  psam_filename <- assoc_qt_data$data$psam_filename
  pvar_filename <- assoc_qt_data$data$pvar_filename
  phe_filename <- paste0(base_input_filename, ".phe")
  log_filename <- paste0(assoc_qt_params$base_output_filename, ".log")

  # Phenotype data: save if in-memory
  if (plinkr::is_phenotype_data_table(assoc_qt_data$phenotype_data)) {
    assoc_qt_data$phenotype_data <- plinkr::save_phenotype_data_table(
      phenotype_data_table = assoc_qt_data$phenotype_data,
      phe_filename = phe_filename
    )
    testthat::expect_true(file.exists(phe_filename))
    testthat::expect_equal(
      assoc_qt_data$phenotype_data$phe_filename,
      phe_filename
    )
  }

  testthat::expect_true(file.exists(pgen_filename))
  testthat::expect_true(file.exists(psam_filename))
  testthat::expect_true(file.exists(pvar_filename))
  testthat::expect_true(file.exists(phe_filename))

  # PLINK will not do so and will not give an error
  dir.create(
    dirname(assoc_qt_params$base_output_filename),
    showWarnings = FALSE,
    recursive = TRUE
  )

  args <- plinkr::create_assoc_qt_args(
    assoc_qt_data = assoc_qt_data,
    assoc_qt_params = assoc_qt_params,
    plink_options = plink_options
  )
  plinkr::run_plink(
    args = args,
    plink_options = plink_options,
    verbose = verbose
  )
  qassoc_filenames <- list.files(
    path = dirname(assoc_qt_params$base_output_filename),
    pattern = "\\..*\\.glm\\.linear",
    full.names = TRUE
  )
  list(
    qassoc_filenames = qassoc_filenames,
    log_filename = log_filename
  )
}
