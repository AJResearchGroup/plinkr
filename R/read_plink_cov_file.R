#' Read a \code{PLINK} covariates file
#'
#' Read a \code{PLINK} covariates file
#' @note The filename extension used in the \code{PLINK}
#' tutorial is \code{.covar}
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble} with the following columns:
#'   * \code{FID} The family ID
#'   * \code{IID} Within-family ID (cannot be zero)
#'   * \code{Px} One or more columns with phenotypic values,
#'     where \code{x} is the index of the trait:
#'     the first column is called \code{P1}, the second \code{P2},
#'     etcetera.
#' The \code{FID}, \code{IID} and \code{Px} column names
#' match the PLINK names, see
#' \url{https://www.cog-genomics.org/plink/1.9/input#pheno}
#' @author Richèl J.C. Bilderbeek
#' @export
read_plink_cov_file <- function(
  cov_filename
) {
  testthat::expect_true(file.exists(cov_filename))
  text_lines <- readr::read_lines(cov_filename)

  text_matrix <- stringr::str_split(
    string = text_lines,
    pattern = "[:blank:]+",
    simplify = TRUE
  )

  # The column names FID and IID match the PLINK names of the same
  # data in the phenotype files,
  # https://www.cog-genomics.org/plink/1.9/input#pheno
  column_names <- NA
  if (text_matrix[1, 1] == "FID" && text_matrix[1, 2] == "IID") {
    column_names <- text_matrix[1, ]
    text_matrix <- text_matrix[-1, ]
  } else {
    column_names <- c(
      "FID",
      "IID",
      paste0("P", seq_len(ncol(text_matrix) - 2))
    )
  }

  t <-  tibble::as_tibble(
    text_matrix,
    .name_repair = "minimal"
  )
  testthat::expect_equal(length(names(t)), length(column_names))
  names(t) <- column_names

  # Convert all columns to numeric
  # FID is a character vector in the tutorial
  FID <- NULL # nolint use Tidyverse global
  t <- dplyr::mutate(
    dplyr::select(t, dplyr::everything()),
    dplyr::across(dplyr::everything() & !FID, as.numeric)
  )
  t
}
