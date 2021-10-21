#' Create a single-phenotype table from pedigree (\code{.psam}) table
#'
#' Create a single-phenotype table from pedigree (\code{.psam}) table.
#' The individuals' family and within-family ID's are copied.
#' The \code{pheno} is copied as well, but
#' renamed to \code{P1} and divided by ten.
#' In this way, PLINK treats the phenotype table as having quantitative
#' traits.
#' @inheritParams default_params_doc
#' @return a single-phenotype \link[tibble]{tibble}, with columns:
#'
#' * \code{FID} the family ID
#' * \code{IID} the within-family ID
#' * \code{P1} the phenotype
#'
#' The column names match the PLINK names, see
#' \url{https://www.cog-genomics.org/plink/1.9/input#pheno}
#' @examples
#' create_phe_table_from_psam_table(get_test_psam_table())
#' @author Richèl J.C. Bilderbeek
#' @export
create_phe_table_from_psam_table <- function(psam_table) { # nolint indeed a long and descriptive name
  plinkr::check_psam_table(psam_table)

  phe_table <- tibble::tibble(
    FID = psam_table$FID,
    IID = psam_table$IID,
    P1 = psam_table$PHENO1 / 10.0
  )
  plinkr::check_phe_table(phe_table)
  phe_table
}
