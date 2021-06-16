#' Let PLINK detect an association with one binary traits.
#'
#' @note This function is named after the \code{--assoc} flag used by PLINK
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble} with the following columns:
#'
#'   * \code{CHR}: Chromosome number
#'   * \code{SNP}: SNP identifier
#'   * \code{BP}: Physical position (base-pair)
#'   * \code{A1}: Minor allele name (based on whole sample)
#'   * \code{F_A}: Frequency of this allele in cases
#'   * \code{F_U}: Frequency of this allele in controls
#'   * \code{A2}: Major allele name
#'   * \code{CHISQ}: Basic allelic test chi-square (1df)
#'   * \code{P}: Asymptotic p-value for this test
#'   * \code{OR}: Estimated odds ratio (for A1, i.e. A2 is reference)
#'   * \code{SE}: Standard error of the estimated log(odds ratio)
#'   * \code{L95}: Lower bound of the 95% confidence interval of the odds ratio
#'   * \code{U95}: Upper bound of the 95% confidence interval of the odds ratio
#'
#' The table with have as much rows as the number of SNPs
#'
#' Note that parameters in uppercase are named as such by PLINK.
#' @examples
#' if (is_plink_installed()) {
#'   assoc(create_demo_assoc_params())
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
plink_assoc <- function(
  assoc_params,
  plink_options = create_plink_options(),
  verbose = FALSE
) {
  plinkr::check_assoc_params(assoc_params)
  plinkr::check_plink_options(plink_options)
  testthat::expect_true(plink_options$plink_version %in% c("1.7", "1.9"))

  # Filenames
  ped_filename <- paste0(assoc_params$base_input_filename, ".ped")
  map_filename <- paste0(assoc_params$base_input_filename, ".map")
  assoc_filename <- paste0(assoc_params$base_output_filename, ".assoc")

  # 'save_' functions will check for success themselves
  plinkr::save_ped_table_to_file(
    ped_table = assoc_params$ped_table,
    ped_filename = ped_filename
  )
  plinkr::save_map_table_to_file(
    map_table = assoc_params$map_table,
    map_filename = map_filename
  )

  # PLINK will not do so and will not give an error
  # PLINK2 will suggest to change the out parameter :-)
  dir.create(
    dirname(assoc_params$base_input_filename),
    showWarnings = FALSE,
    recursive = TRUE
  )
  dir.create(
    dirname(assoc_params$base_output_filename),
    showWarnings = FALSE,
    recursive = TRUE
  )
  args <- plinkr::create_assoc_args(
    assoc_params = assoc_params,
    plink_options = plink_options
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
    length(list.files(pattern = assoc_params$base_input_filename))
  )
  unlink(dirname(assoc_params$base_input_filename), recursive = TRUE)
  testthat::expect_equal(
    0,
    length(list.files(pattern = assoc_params$base_output_filename))
  )
  unlink(dirname(assoc_params$base_output_filename), recursive = TRUE)
  assoc_table
}
