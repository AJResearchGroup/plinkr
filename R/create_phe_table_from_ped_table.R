#' Create a single-phenotype table from pedigree (\code{.ped}) table
#'
#' Create a single-phenotype table from pedigree (\code{.ped}) table.
#' The individuals' family and within-family ID's are copied.
#' The \code{case_control_code} is copied as well, but
#' renamed to \code{trait} and divided by then.
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
#' @author Richèl J.C. Bilderbeek
#' @export
create_phe_table_from_ped_table <- function(ped_table) { # nolint indeed a long and descriptive name
  plinkr::check_ped_table(ped_table)

  tibble::tibble(
    FID = ped_table$FID,
    IID = ped_table$IID,
    P1 = ped_table$case_control_code / 10.0
  )
}
