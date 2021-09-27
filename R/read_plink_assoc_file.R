#' Read a PLINK \code{.assoc} file
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble}.
#'
#' The \link[tibble]{tibble} has these columns:
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
#' read_plink_assoc_file(
#'   assoc_filename = get_plinkr_filename("run1.assoc")
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
read_plink_assoc_file <- function(assoc_filename) {
  testthat::expect_true(file.exists(assoc_filename))
  text_lines_raw <- readr::read_lines(
    assoc_filename
  )
  text_lines <- plinkr::safe_str_trim(text_lines_raw)
  text_matrix <- plinkr::safe_str_split(string = text_lines)

  if (nrow(text_matrix) > 2) {
    t <- tibble::as_tibble(
      text_matrix[-1, ],
      .name_repair = "minimal"
    )
  } else {
    testthat::expect_equal(2, nrow(text_matrix))
    # else, tibble will create a 1-column table
    t <- tibble::as_tibble_row(
      text_matrix[-1, ],
      .name_repair = "minimal"
    )
  }
  names(t) <- text_matrix[1, ]
  t
  t$CHR <- as.numeric(t$CHR) # nolint PLINK coding style
  t$BP <- as.numeric(t$BP) # nolint PLINK coding style
  t$F_A <- suppressWarnings(as.numeric(t$F_A)) # May be NA  # nolint PLINK coding style
  t$F_U <- suppressWarnings(as.numeric(t$F_U)) # May be NA  # nolint PLINK coding style
  t$CHISQ <- suppressWarnings(as.numeric(t$CHISQ)) # May be NA  ## nolint PLINK coding style
  t$P <- suppressWarnings(as.numeric(t$P)) # nolint PLINK coding style
  t$OR <- suppressWarnings(as.numeric(t$OR)) # May be NA # nolint PLINK coding style
  if ("SE" %in% names(t)) suppressWarnings(t$SE <- as.numeric(t$SE)) # May be NA # nolint PLINK coding style
  if ("L95" %in% names(t)) suppressWarnings(t$L95 <- as.numeric(t$L95)) # May be NA # nolint PLINK coding style
  if ("U95" %in% names(t)) suppressWarnings(t$U95 <- as.numeric(t$U95)) # May be NA # nolint PLINK coding style
  t
}
