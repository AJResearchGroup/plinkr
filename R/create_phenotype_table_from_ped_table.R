#' Create a single-phenotype table from a \code{.ped} table
#' @inheritParams default_params_doc
#' @return a single-phenotype \link[tibble]{tibble}, with columns:
#'
#' * \code{family_id}
#' * \code{within_family_id}
#' * \code{.phenotype_value}
#'
#' @export
create_phenotype_table_from_ped_table <- function(ped_table) { # nolint indeed a long and descriptive name
  plinkr::check_ped_table(ped_table)

  tibble::tibble(
    family_id = ped_table$family_id,
    within_family_id = ped_table$within_family_id,
    phenotype_value = ped_table$phenotype_value
  )
}
