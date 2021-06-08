#' Read a PLINK \code{.assoc} file
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble}.
#'
#' The \link[tibble]{tibble} has these columns:
#'
#'  * `CHR`: Chromosome
#'  * `SNP`: SNP ID
#'  * `BP`: Physical position (base-pair)
#'  * `A1`: Minor allele name (based on whole sample)
#'  * `F_A`: Frequency of this allele in cases
#'  * `F_U`: Frequency of this allele in controls
#'  * `A2`: Major allele name
#'  * `CHISQ`: Basic allelic test chi-square (1 degree of fredoom)
#'  * `P`: Asymptotic p-value for this test
#'  * `OR`: Estimated odds ratio (for A1, i.e. A2 is reference)
#'  * `SE`: Standard error
#'  * `L95`: Lower bound of the 95% confidence interval of the odds ratio
#'  * `U95`: Upper bound of the 95% confidence interval of the odds ratio
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
  # There is whitespace at start and end
  text_lines <- stringr::str_trim(text_lines_raw)

  text_matrix <- stringr::str_split(
    string = text_lines,
    pattern = "[:blank:]+",
    simplify = TRUE
  )

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
  suppressWarnings(t$F_A <- as.numeric(t$F_A)) # May be NA  # nolint PLINK coding style
  t$F_U <- suppressWarnings(as.numeric(t$F_U)) # May be NA  # nolint PLINK coding style
  t$CHISQ <- as.numeric(t$CHISQ) # nolint PLINK coding style
  t$P <- as.numeric(t$P) # nolint PLINK coding style
  suppressWarnings(t$OR <- as.numeric(t$OR)) # May be NA # nolint PLINK coding style
  if ("SE" %in% names(t)) t$SE <- as.numeric(t$SE) # nolint PLINK coding style
  if ("L95" %in% names(t)) t$L95 <- as.numeric(t$L95) # nolint PLINK coding style
  if ("U95" %in% names(t)) t$U95 <- as.numeric(t$U95) # nolint PLINK coding style
  t
}
