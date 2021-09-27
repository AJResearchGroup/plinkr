#' Read a PLINK \code{.lmiss} file
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble} with column names:
#'   * \code{CHR} ?
#'   * \code{SNP} ?
#'   * \code{N_MISS} ?
#'   * \code{N_GENO} ?
#'   * \code{F_MISS} ?
#'
#' These column names are the names used by \code{PLINK}.
#' @author Richèl J.C. Bilderbeek
#' @export
read_plink_lmiss_file <- function(lmiss_filename) {
  table <- plinkr::safe_str_split(
    plinkr::safe_str_trim(
      readr::read_lines(
        file = lmiss_filename,
        skip_empty_rows = TRUE
      )
    )
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
