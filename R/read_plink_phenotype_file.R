#' Read a PLINK raw phenotype file
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
#' @examples
#' read_plink_phenotype_file(
#'   phenotype_filename = get_plinkr_filename("pheno.raw")
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
read_plink_phenotype_file <- function(phenotype_filename) {
  testthat::expect_true(file.exists(phenotype_filename))
  text_lines <- readr::read_lines(phenotype_filename)

  text_matrix <- stringr::str_split(
    string = text_lines,
    pattern = "[:blank:]+",
    simplify = TRUE
  )
  t <-  tibble::as_tibble(
    text_matrix,
    .name_repair = "minimal"
  )
  n_phenotypes <- ncol(t) - 2
  testthat::expect_true(n_phenotypes >= 1)

  # The column names FID and IID match the PLINK names of the same
  # data in the phenotype files,
  # https://www.cog-genomics.org/plink/1.9/input#pheno
  names(t) <- c(
    "FID",
    "IID",
    paste0("P", seq_len(n_phenotypes))
  )
  # Convert all columns to numeric
  t <- dplyr::mutate(
    dplyr::select(t, dplyr::everything()),
    dplyr::across(dplyr::everything(), as.numeric)
  )
  t
}
