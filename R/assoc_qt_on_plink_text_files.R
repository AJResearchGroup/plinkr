#' Let `PLINK` detect an association with one or more quantitative traits
#' with files in `PLINK` text format.
#'
#' Let `PLINK` detect an association with one or more quantitative traits
#' with files in `PLINK` text format.
#' @inheritParams default_params_doc
#' @return a \link{list} with the following elements:
#'
#'  * `qassoc_filenames`: names of the created association files
#'  * `log_filename`: name of the PLINK log file
#'
#' @seealso use \link{assoc_qt_on_plink_bin_data} to work on data directly
#' @note This function is named after the \code{--assoc} flag used by PLINK.
#' @author Richèl J.C. Bilderbeek
#' @export
assoc_qt_on_plink_text_files <- function(
  assoc_qt_params,
  plink_options = create_plink_v1_9_options(),
  verbose = FALSE
) {
  plinkr::check_assoc_qt_params(assoc_qt_params)
  plinkr::check_plink_text_filenames(assoc_qt_params$data)

  testthat::expect_true(file.exists(assoc_qt_params$data$map_filename))
  testthat::expect_true(file.exists(assoc_qt_params$data$ped_filename))

  phe_filename <- paste0(assoc_qt_params$base_input_filename, ".phe")
  phe_table <- plinkr::read_plink_phe_file(phe_filename)
  phenotype_names <- names(phe_table)[c(-1, -2)]
  qassoc_filenames <- paste0(
    assoc_qt_params$base_output_filename, ".", phenotype_names,
    ".qassoc"
  )
  log_filename <- paste0(assoc_qt_params$base_output_filename, ".log")

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
  list(
    qassoc_filenames = qassoc_filenames,
    log_filename = log_filename
  )
}
