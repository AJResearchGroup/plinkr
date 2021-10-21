#' Create a single-phenotype table from pedigree (\code{.ped}) table
#' within the PLINK binary data.
#'
#' Create a single-phenotype table from pedigree (\code{.ped}) table
#' within the PLINK binary data.
#' The individuals' family and within-family ID's are copied.
#' The \code{case_control_code} is copied as well, but
#' renamed to \code{trait} and divided by then.
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
#' create_phe_table_from_plink_bin_data(create_test_plink_bin_data())
#' @author Richèl J.C. Bilderbeek
#' @export
create_phe_table_from_plink_bin_data <- function(plink_bin_data) { # nolint indeed a long and descriptive name
  plinkr::check_plink_bin_data(plink_bin_data)
  plinkr::create_phe_table_from_fam_table(plink_bin_data$fam_table)
}
