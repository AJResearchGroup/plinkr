#' Read a PLINK \code{.assoc.adjusted} file
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
read_plink_assoc_adjusted_file <- function(assoc_adjusted_filename) {
  testthat::expect_true(file.exists(assoc_adjusted_filename))
  text_lines_raw <- readr::read_lines(
    assoc_adjusted_filename
  )
  # stringr::str_trim **sometimes** gives an 'embedded nul in string'
  # error.
  # This has been reported at https://github.com/tidyverse/stringr/issues/399 .
  # Until then, just try multiple times :-)
  text_lines <- NA
  while (length(text_lines) == 1 && is.na(text_lines)) {
    # There is whitespace at start and end
    tryCatch(
      text_lines <- stringr::str_trim(text_lines_raw),
      error = function(e) {} # nolint ignore

    )
  }

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
  expected_names <- c(
    "CHR", "SNP", "UNADJ", "GC", "BONF", "HOLM", "SIDAK_SS", "SIDAK_SD",
    "FDR_BH", "FDR_BY"
  )
  testthat::expect_equal(expected_names, names(t))

  t
  t$CHR <- as.numeric(t$CHR) # nolint PLINK coding style
  t$UNADJ <- as.numeric(t$UNADJ) # nolint PLINK coding style
  t$GC <- as.numeric(t$GC) # nolint PLINK coding style
  t$BONF <- as.numeric(t$BONF) # nolint PLINK coding style
  t$HOLM <- as.numeric(t$HOLM) # nolint PLINK coding style
  t$SIDAK_SS <- as.numeric(t$SIDAK_SS) # nolint PLINK coding style
  t$SIDAK_SD <- as.numeric(t$SIDAK_SD) # nolint PLINK coding style
  t$FDR_BH <- as.numeric(t$FDR_BH) # nolint PLINK coding style
  t$FDR_BY <- as.numeric(t$FDR_BY) # nolint PLINK coding style
  t
}
