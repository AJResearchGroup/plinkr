#' Let PLINK detect an association with one binary traits.
#'
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
#' if (is_plink_installed() && 1 == 2) {
#'   assoc(create_demo_assoc_params())
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
assoc <- function(
  assoc_params,
  plink_options = create_plink_options(),
  verbose = FALSE
) {
  plinkr::check_assoc_params(assoc_params)
  plinkr::check_plink_options(plink_options)

  # Do not be smart yet
  ped_table <- assoc_params$ped_table
  map_table <- assoc_params$map_table
  maf <- assoc_params$maf

  # Filename
  temp_folder <- plinkr::get_plinkr_tempfilename()
  base_input_filename <- file.path(temp_folder, "assoc_input")
  output_filename_base <- file.path(temp_folder, "assoc_output")
  ped_filename <- paste0(base_input_filename, ".ped")
  map_filename <- paste0(base_input_filename, ".map")
  assoc_filename <- paste0(output_filename_base, ".assoc")

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

  # PLINK will not do so and will not give an error
  dir.create(
    dirname(assoc_filename),
    showWarnings = FALSE,
    recursive = TRUE
  )

  args <- c(
    "--map", map_filename,
    "--ped", ped_filename,
    "--assoc",
    "--maf", maf,
    "--out", output_filename_base
  )

  plinkr::run_plink(
    args = args,
    plink_options = plink_options,
    verbose = verbose
  )

  assoc_table <- plinkr::read_plink_assoc_file(assoc_filename)

  file.remove(map_filename)
  file.remove(ped_filename)
  file.remove(assoc_filename)
  testthat::expect_equal(
    0,
    length(list.files(pattern = base_input_filename))
  )
  unlink(temp_folder, recursive = TRUE)
  assoc_table
}
