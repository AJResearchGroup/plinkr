#' Let PLINK detect an association with one or more quantitative traits.
#'
#' Let PLINK detect an association with one or more quantitative traits.
#' @note This function is named after the \code{--assoc} flag used by PLINK.
#' @inheritParams default_params_doc
#' @return
#' A \link[tibble]{tibble} with the detected associations.
#' The table with have as much rows as the number of SNPs multiplied
#' by the number of traits.
#'
#' If the `assoc_qt_params` used PLINK1 text or PLINK1 binary data,
#' the \link[tibble]{tibble} has the following columns:
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
assoc_qt <- function(
  assoc_qt_params,
  plink_options = create_plink_options(),
  verbose = FALSE
) {
  # Other inputs are checked in the specific function called
  plinkr::check_assoc_qt_params(assoc_qt_params)
  qassoc_table <- NULL
  if (is_plink_text_data(assoc_qt_params$data)) {
    qassoc_table <- plinkr::assoc_qt_on_plink_text_data(
      assoc_qt_params = assoc_qt_params,
      plink_options = plink_options,
      verbose = verbose
    )
  } else if (is_plink_bin_data(assoc_qt_params$data)) {
    qassoc_table <- plinkr::assoc_qt_on_plink_bin_data(
      assoc_qt_params = assoc_qt_params,
      plink_options = plink_options,
      verbose = verbose
    )
  } else {
    testthat::expect_true(plinkr::is_plink2_bin_data(assoc_qt_params$data))
    qassoc_table <- plinkr::assoc_qt_on_plink2_bin_data(
      assoc_qt_params = assoc_qt_params,
      plink_options = plink_options,
      verbose = verbose
    )
  }
  qassoc_table
}
