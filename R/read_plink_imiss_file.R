#' Read a PLINK \code{.imiss} file
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble} with column names:
#'   * \code{FIF} family ID
#'   * \code{IID} Within-family ID
#'   * \code{MISS_PHENO} ?
#'   * \code{N_MISS} ?
#'   * \code{N_GENO} ?
#'   * \code{F_MISS} ?
#'
#' These column names are the names used by \code{PLINK}.
#' @author Richèl J.C. Bilderbeek
#' @export
read_plink_imiss_file <- function(imiss_filename) {
  table <- plinkr::safe_str_split(
    stringr::str_trim(
      readr::read_lines(
        file = imiss_filename,
        skip_empty_rows = TRUE
      )
    )
  )
  t <- tibble::as_tibble(table[-1, ], .name_repair = "minimal")
  names(t) <- table[1, ]
  expected_names <- c(
    "FID", "IID", "MISS_PHENO", "N_MISS", "N_GENO", "F_MISS"
  )
  testthat::expect_equal(expected_names, names(t))

  t$IID <- as.numeric(t$IID) # nolint use PLINK notation
  t$N_MISS <- as.numeric(t$N_MISS) # nolint use PLINK notation
  t$N_GENO <- as.numeric(t$N_GENO) # nolint use PLINK notation
  t$F_MISS <- as.numeric(t$F_MISS) # nolint use PLINK notation
  t
}
