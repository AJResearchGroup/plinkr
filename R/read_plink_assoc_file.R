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
  t <-  tibble::as_tibble(
    text_matrix[-1, ],
    .name_repair = "minimal"
  )
  names(t) <- text_matrix[1, ]
  t
  t$CHR <- as.numeric(t$CHR)
  t$BP <- as.numeric(t$BP)
  t$F_A <- as.numeric(t$F_A)
  t$F_U <- as.numeric(t$F_U)
  t$CHISQ <- as.numeric(t$CHISQ)
  t$P <- as.numeric(t$P)
  t$OR <- as.numeric(t$OR)
  t
}
