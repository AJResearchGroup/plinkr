#' Let \code{PLINK}/\code{PLINK2}
#' do a binary-trait/case-control association
#'
#' Let \code{PLINK}/\code{PLINK2}
#' do a binary-trait/case-control association
#' from PLINK1 binary filenames
#' @note This function is named after the \code{--assoc} \code{--adjust} flags
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
#' @author Richèl J.C. Bilderbeek
#' @export
assoc_adjust_from_bfile <- function(
  bfile,
  out
) {
  base_binary_filenames <- bfile
  base_assoc_filenames <- out
  plinkr::run_plink(
    args = c(
      "--bfile", base_binary_filenames,
      "--assoc",
      "--adjust",
      "--out", base_assoc_filenames
    )
  )
  assoc_filenames <- list.files(
    dirname(base_assoc_filenames),
    pattern = basename(base_assoc_filenames),
    full.names = TRUE
  )
  base_assoc_filename <- paste0(basename(base_assoc_filenames), ".assoc")
  base_assoc_adjusted_filename <- paste0(
    basename(base_assoc_filenames),
    ".assoc.adjusted"
  )
  base_log_filename <- paste0(basename(base_assoc_filenames), ".log")
  assoc_filename <- stringr::str_subset(
    assoc_filenames,
    paste0(base_assoc_filename, "$")
  )
  assoc_adjusted_filename <- stringr::str_subset(
    assoc_filenames,
    paste0(base_assoc_adjusted_filename, "$")
  )
  log_filename <- stringr::str_subset(
    assoc_filenames,
    paste0(base_log_filename, "$")
  )
  testthat::expect_true(file.exists(assoc_filename))
  testthat::expect_true(file.exists(assoc_adjusted_filename))
  testthat::expect_true(file.exists(log_filename))
  assoc_result <- list(
    assoc_table = plinkr::read_plink_assoc_file(assoc_filename),
    assoc_adjusted_table = plinkr::read_plink_assoc_adjusted_file(
      assoc_adjusted_filename
    ),
    log = plinkr::read_plink_log_file(log_filename)
  )
  file.remove(assoc_filenames)
  assoc_result
}
