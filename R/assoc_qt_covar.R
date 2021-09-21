#' Let PLINK detect an association with one ore more quantitative traits.
#'
#' Let PLINK detect an association with one ore more quantitative traits.
#' @note This function is named after the \code{--assoc} flag used by PLINK
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble} with the following columns:
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
#' The table with have as much rows as the number of SNPs multiplied
#' by the number of traits.
#'
#' Note that parameters in uppercase are named as such by PLINK.
#' @examples
#' if (is_plink_installed()) {
#'   assoc_qt(assoc_qt_params = create_demo_assoc_qt_covar_params())
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
assoc_qt_covar <- function(
  assoc_qt_covar_params,
  plink_options = create_plink_options(),
  verbose = FALSE
) {
  plinkr::check_assoc_qt_covar_params(assoc_qt_covar_params)
  plinkr::check_plink_options(plink_options)
  plinkr::check_verbose(verbose)

  # Do not be smart yet
  ped_table <- assoc_qt_covar_params$ped_table
  map_table <- assoc_qt_covar_params$map_table
  phe_table <- assoc_qt_covar_params$phe_table
  cov_table <- assoc_qt_covar_params$cov_table
  phenotype_names <- names(assoc_qt_covar_params$phe_table)[c(-1, -2)]

  # Filenames
  base_input_filename <- assoc_qt_covar_params$base_input_filename
  ped_filename <- paste0(base_input_filename, ".ped")
  map_filename <- paste0(base_input_filename, ".map")
  phe_filename <- paste0(base_input_filename, ".phe")
  cov_filename <- paste0(base_input_filename, ".cov")
  qassoc_filenames <- paste0(
    assoc_qt_covar_params$base_output_filename, ".", phenotype_names,
    ".qassoc"
  )
  log_filename <- paste0(assoc_qt_covar_params$base_output_filename, ".log")

  # 'save_' functions will check for success themselves
  plinkr::save_ped_table_to_file(
    ped_table = ped_table,
    ped_filename = ped_filename
  )
  plinkr::save_map_table_to_file(
    map_table = map_table,
    map_filename = map_filename
  )
  plinkr::save_phe_table_to_file(
    phe_table = phe_table,
    phe_filename = phe_filename
  )
  plinkr::save_cov_table_to_file(
    cov_table = cov_table,
    cov_filename = cov_filename
  )

  # PLINK will not do so and will not give an error
  dir.create(
    dirname(assoc_qt_covar_params$base_output_filename),
    showWarnings = FALSE,
    recursive = TRUE
  )

  args <- plinkr::create_assoc_qt_covar_args(
    assoc_qt_covar_params = assoc_qt_covar_params,
    plink_options = plink_options
  )
  plinkr::run_plink(
    args = args,
    plink_options = plink_options,
    verbose = verbose
  )

  stop("HIERO")

  qassoc_table <- plinkr::read_plink_qassoc_files(
    qassoc_filenames = qassoc_filenames
  )
  if (verbose) {
    message(paste(plinkr::read_plink_log_file(log_filename), collapse = "\n"))
  }

  file.remove(map_filename)
  file.remove(ped_filename)
  file.remove(phe_filename)
  for (qassoc_filename in qassoc_filenames) file.remove(qassoc_filename)
  file.remove(log_filename)
  testthat::expect_equal(
    0,
    length(list.files(pattern = base_input_filename))
  )
  unlink(
    dirname(assoc_qt_covar_params$base_input_filename),
    recursive = TRUE
  )
  unlink(
    dirname(assoc_qt_covar_params$base_output_filename),
    recursive = TRUE
  )

  qassoc_table
}
