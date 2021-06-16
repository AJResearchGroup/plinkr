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
#'   assoc_qt(create_demo_assoc_qt_params())
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
assoc_qt <- function(
  assoc_qt_params,
  plink_options = create_plink_options(),
  verbose = FALSE
) {
  plinkr::check_assoc_qt_params(assoc_qt_params)
  plinkr::check_plink_options(plink_options)
  plinkr::check_verbose(verbose)

  # Do not be smart yet
  ped_table <- assoc_qt_params$ped_table
  map_table <- assoc_qt_params$map_table
  phenotype_table <- assoc_qt_params$phenotype_table
  maf <- assoc_qt_params$maf
  n_phenotypes <- ncol(assoc_qt_params$phenotype_table) - 2

  # Filenames
  temp_folder <- plinkr::get_plinkr_tempfilename()
  base_input_filename <- file.path(temp_folder, "assoc_qt_input")
  output_filename_base <- file.path(temp_folder, "assoc_qt_output")
  ped_filename <- paste0(base_input_filename, ".ped")
  map_filename <- paste0(base_input_filename, ".map")
  phenotype_filename <- paste0(base_input_filename, ".phenotype")
  qassoc_filename <- paste0(output_filename_base, ".qassoc")
  qassoc_filenames <- paste0(
    output_filename_base, ".P",
    seq_len(n_phenotypes), ".qassoc"
  )
  log_filename <- paste0(output_filename_base, ".log")


  plinkr::save_ped_table_to_file(
    ped_table = ped_table,
    ped_filename = ped_filename
  )
  testthat::expect_true(file.exists(ped_filename))
  plinkr::save_map_table_to_file(
    map_table = map_table,
    map_filename = map_filename
  )
  testthat::expect_true(file.exists(map_filename))
  plinkr::save_phenotype_table_to_file(
    phenotype_table = phenotype_table,
    phenotype_filename = phenotype_filename
  )
  testthat::expect_true(file.exists(phenotype_filename))

  # PLINK will not do so and will not give an error
  dir.create(
    dirname(qassoc_filename),
    showWarnings = FALSE,
    recursive = TRUE
  )

  args <- c(
    "--map", map_filename,
    "--ped", ped_filename,
    "--pheno", phenotype_filename,
    "--all-pheno",
    "--assoc",
    "--allow-extra-chr",
    "--chr-set", 95,
    "--maf", maf,
    "--out", output_filename_base
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

  file.remove(map_filename)
  file.remove(ped_filename)
  file.remove(phenotype_filename)
  file.remove(qassoc_filenames)
  file.remove(log_filename)
  testthat::expect_equal(
    0,
    length(list.files(pattern = base_input_filename))
  )
  unlink(temp_folder, recursive = TRUE)

  qassoc_table
}
