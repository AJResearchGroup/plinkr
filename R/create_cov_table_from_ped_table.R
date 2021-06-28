#' Create a single-covariate table from pedigree (\code{.ped}) table
#'
#' Create a single-covariate table from pedigree (\code{.ped}) table.
#' The individuals' family and within-family ID's are copied.
#' @inheritParams default_params_doc
#' @return a single-covariate \link[tibble]{tibble}, with columns:
#'
#' * \code{FID} the family ID
#' * \code{IID} the within-family ID
#' * \code{C1} the covariate, which is zero by default
#'
#' The column names match the PLINK names, see
#' \url{https://www.cog-genomics.org/plink/1.9/input#covno}
#' @author Richèl J.C. Bilderbeek
#' @export
create_cov_table_from_ped_table <- function(ped_table) { # nolint indeed a long and descriptive name
  plinkr::check_ped_table(ped_table)

  tibble::tibble(
    FID = ped_table$FID,
    IID = ped_table$IID,
    C1 = 0.0
  )
}
