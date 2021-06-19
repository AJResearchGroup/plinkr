#' Read a PLINK \code{.lmiss} file
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble} with column names:
#'   * \code{CHR} .
#'   * \code{SNP} Within-family ID (cannot be zero)
#'   * \code{N_MISS} Within-family ID of father
#'   * \code{N_GENO} Within-family ID of mother
#'   * \code{F_MISS} Sex code
#'   * \code{case_control_code} Case control code
#'   * \code{snv_[x][y]} Nucleotide for the \code{x}th variant
#'
#' These column names are the names used by \code{PLINK}.
#' @author Richèl J.C. Bilderbeek
#' @export
read_plink_lmiss_file <- function(lmiss_filename) {
  # Use str_trim as PLINK adds whitespace around text
  table <- stringr::str_split(
    string = stringr::str_trim(
      readr::read_lines(
        file = lmiss_filename,
        skip_empty_rows = TRUE
      )
    ),
    pattern = "[:blank:]+",
    simplify = TRUE
  )
  t <- tibble::as_tibble(table[-1, ], .name_repair = "minimal")
  names(t) <- table[1, ]
  expected_names <- c(
    "CHR",
    "SNP",
    "N_MISS",
    "N_GENO",
    "F_MISS"
  )
  testthat::expect_equal(expected_names, names(t))

  t$CHR <- as.numeric(t$CHR) # nolint use PLINK notation
  t$N_MISS <- as.numeric(t$N_MISS) # nolint use PLINK notation
  t$N_GENO <- as.numeric(t$N_GENO) # nolint use PLINK notation
  t$F_MISS <- as.numeric(t$F_MISS) # nolint use PLINK notation
  t
}
