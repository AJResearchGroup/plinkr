#' Create a single-phenotype table from pedigree (\code{.fam}) table
#'
#' Create a single-phenotype table from pedigree (\code{.fam}) table.
#' The individuals' family and within-family ID's are copied.
#' The \code{pheno} is copied as well, but
#' renamed to \code{P1} and divided by ten.
#' In this way, PLINK traits the phenotype table as having quantitative
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
#' create_phe_table_from_fam_table(get_test_fam_table())
#' @author Richèl J.C. Bilderbeek
#' @export
create_phe_table_from_fam_table <- function(fam_table) { # nolint indeed a long and descriptive name
  plinkr::check_fam_table(fam_table)

  phe_table <- tibble::tibble(
    FID = fam_table$fam,
    IID = fam_table$id,
    P1 = fam_table$pheno / 10.0
  )
  plinkr::check_phe_table(phe_table)
  phe_table
}
