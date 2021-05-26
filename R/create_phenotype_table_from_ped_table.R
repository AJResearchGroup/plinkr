#' Create a single-phenotype table from pedigree (\code{.ped}) table
#'
#' Create a single-phenotype table from pedigree (\code{.ped}) table.
#' The individuals' family and within-family ID's are copied.
#' The \link{case_control_code} is copied as well, but
#' renamed to \link{trait} and divided by then.
#' In this way, PLINK traits the phenotype table as having quantitative
#' traits.
#' @inheritParams default_params_doc
#' @return a single-phenotype \link[tibble]{tibble}, with columns:
#'
#' * \code{family_id}
#' * \code{within_family_id}
#' * \code{trait}
#'
#' @export
create_phenotype_table_from_ped_table <- function(ped_table) { # nolint indeed a long and descriptive name
  plinkr::check_ped_table(ped_table)

  tibble::tibble(
    family_id = ped_table$family_id,
    within_family_id = ped_table$within_family_id,
    trait = ped_table$case_control_code / 10.0
  )
}
