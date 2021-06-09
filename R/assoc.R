#' Let \code{PLINK}/\code{PLINK2} detect an association for a binary trait.
#'
#' @note This function is named after the \code{--assoc} flag
#' used by \code{PLINK}
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
assoc <- function(
  assoc_params,
  plink_options = create_plink_options(),
  verbose = FALSE
) {
  plinkr::check_assoc_params(assoc_params)
  plinkr::check_plink_options(plink_options)
  if (plink_options$plink_version %in% c("1.7", "1.9")) {
    return(
      plinkr::plink_assoc(
        assoc_params = assoc_params,
        plink_options = plink_options,
        verbose = verbose
      )
    )
  }
  testthat::expect_equal("2.0", plink_options$plink_version)
  plinkr::plink2_assoc(
    assoc_params = assoc_params,
    plink_options = plink_options,
    verbose = verbose
  )
}
