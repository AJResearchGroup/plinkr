#' Read a PLINK raw phenotype file
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble} with the following columns:
#'   * \code{family_id} The family ID (\code{FID})
#'   * \code{within_family_id} Within-family ID
#'       (\code{IID}, cannot be zero)
#'   * One or more columns of phenotype values,
#'     columns can have any name
#' @examples
#' read_plink_phenotype_file(
#'   phenotype_filename = get_plinkr_filename("pheno.raw")
#' )
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

  names(t) <- c(
    "family_id",
    "within_family_id",
    paste0("phenotype_", seq_len(n_phenotypes))
  )
  # Convert all columns to numeric
  t <- dplyr::mutate(
    dplyr::select(t, dplyr::everything()),
    dplyr::across(dplyr::everything(), as.numeric)
  )
  t
}
