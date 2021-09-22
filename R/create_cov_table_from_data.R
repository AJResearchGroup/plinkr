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
#' @examples
#' create_cov_table_from_data(data = create_test_plink_text_data())
#' @author Richèl J.C. Bilderbeek
#' @export
create_cov_table_from_data <- function(data) { # nolint indeed a long and descriptive name
  plinkr::check_data(data)
  if (plinkr::is_plink_text_data(data)) {
    return(plinkr::create_cov_table_from_ped_table(data$ped_table))
  }
  if (plinkr::is_plink_bin_data(data)) {
    stop("No idea")
  }
  testthat::expect_true(plinkr::is_plink2_bin_data(data))
  stop("No idea")
}
