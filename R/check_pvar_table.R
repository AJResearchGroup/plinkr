#' Check if a \code{.pvar} table is valid.
#'
#' Check if a \code{.pvar} table is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return Nothing. Will \link{stop} if the \code{pvar_table} is invalid
#' @examples
#' check_pvar_table(get_test_pvar_table())
#' @author Richèl J.C. Bilderbeek
#' @export
check_pvar_table <- function(pvar_table) {
  testthat::expect_true(tibble::is_tibble(pvar_table))
  testthat::expect_equal(5, ncol(pvar_table))
  testthat::expect_equal("CHROM", names(pvar_table)[1])
  testthat::expect_equal("POS", names(pvar_table)[2])
  testthat::expect_equal("ID", names(pvar_table)[3])
  testthat::expect_equal("REF", names(pvar_table)[4])
  testthat::expect_equal("ALT", names(pvar_table)[5])
}
