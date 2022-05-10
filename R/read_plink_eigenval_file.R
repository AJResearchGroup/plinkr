#' Read a `PLINK`/`PLINK2` `.eigenval` file
#'
#' Read a `PLINK`/`PLINK2` `.eigenval` file.
#'
#' By default, \link{pca} (the function to do principal
#' component analysis) uses 20 Eigenvalues
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble} with the following columns:
#'   * `eigenval`: the Eigenvalue
#' @seealso use \link{get_test_eigenval_table} to get an
#' Eigenvalue table, to be used in testing
#' @examples
#' read_plink_eigenval_file(
#'   eigenval_filename = get_plinkr_filename("pca.eigenval")
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
read_plink_eigenval_file <- function(
  eigenval_filename
) {
  testthat::expect_true(file.exists(eigenval_filename))
  readr::read_csv(
    eigenval_filename,
    col_names = "eigenval",
    col_types = readr::cols(readr::col_number())
  )
}
